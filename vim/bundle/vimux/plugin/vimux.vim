if exists("g:loaded_vimux") || &cp
  finish
endif
let g:loaded_vimux = 1

if !has("ruby")
  finish
end

command RunLastVimTmuxCommand :call RunLastVimTmuxCommand()
command CloseVimTmuxRunner :call CloseVimTmuxRunner()
command CloseVimTmuxPanes :call CloseVimTmuxPanes()
command CloseVimTmuxWindows :call CloseVimTmuxWindows()
command InspectVimTmuxRunner :call InspectVimTmuxRunner()
command InterruptVimTmuxRunner :call InterruptVimTmuxRunner()
command PromptVimTmuxCommand :call PromptVimTmuxCommand()

function RunVimTmuxCommand(command, ...)
  let l:autoreturn = 1

  if exists("a:1")
    let l:autoreturn = a:1
  endif

  let g:_VimTmuxCmd = a:command

  if l:autoreturn == 1
    ruby CurrentTmuxSession.new.run_shell_command(Vim.evaluate("g:_VimTmuxCmd"))
  else
    ruby CurrentTmuxSession.new.run_shell_command(Vim.evaluate("g:_VimTmuxCmd"), false)
  endif
endfunction

function RunLastVimTmuxCommand()
  if exists("g:_VimTmuxCmd")
    ruby CurrentTmuxSession.new.run_shell_command(Vim.evaluate("g:_VimTmuxCmd"))
  else
    echo "No last command"
  endif
endfunction

function ClearVimTmuxWindow()
  if exists("g:_VimTmuxRunnerPane")
    unlet g:_VimTmuxRunnerPane
  end
endfunction

function CloseVimTmuxWindows()
  ruby CurrentTmuxSession.new.close_other_panes
  call ClearVimTmuxWindow()
  echoerr "CloseVimTmuxWindows is deprecated, use CloseVimTmuxPanes"
endfunction

function CloseVimTmuxRunner()
  ruby CurrentTmuxSession.new.close_runner_pane
  call ClearVimTmuxWindow()
endfunction

function CloseVimTmuxPanes()
  ruby CurrentTmuxSession.new.close_other_panes
  call ClearVimTmuxWindow()
endfunction

function InterruptVimTmuxRunner()
  ruby CurrentTmuxSession.new.interrupt_runner
endfunction

function InspectVimTmuxRunner()
  ruby CurrentTmuxSession.new.inspect_runner
endfunction

function PromptVimTmuxCommand()
  let l:command = input("Command? ")
  call RunVimTmuxCommand(l:command)
endfunction

ruby << EOF
class TmuxSession
  def initialize(session, window, pane)
    @session = session
    @window = window
    @pane = pane
    @runner_pane = vim_cached_runner_pane
  end

  def vim_cached_runner_pane
    if Vim.evaluate('exists("g:_VimTmuxRunnerPane")') != 0
      Vim.evaluate('g:_VimTmuxRunnerPane')
    else
      nil
    end
  end

  def vim_cached_runner_pane=(runner_pane)
    Vim.command("let g:_VimTmuxRunnerPane = '#{runner_pane}'")
  end

  def clear_vim_cached_runner_pane
    Vim.command("unlet g:_VimTmuxRunnerPane")
  end

  def height
    if Vim.evaluate('exists("g:VimuxHeight")') != 0
      Vim.evaluate('g:VimuxHeight')
    else
      20
    end
  end

  def orientation
    if Vim.evaluate('exists("g:VimuxOrientation")') != 0 && ["h", "v"].include?(Vim.evaluate('g:VimuxOrientation'))
      "-#{Vim.evaluate('g:VimuxOrientation')}"
    else
      "-v"
    end
  end

  def reset_sequence
    if Vim.evaluate('exists("g:VimuxResetSequence")') != 0
      "#{Vim.evaluate('g:VimuxResetSequence')}"
    else
      "q C-u"
    end
  end

  def inspect_runner
    _run("select-pane -t #{target(:pane => runner_pane)}")
    _run("copy-mode")
  end

  def current_panes
    _run('list-panes').split("\n").map do |line|
      line.split(':').first
    end
  end

  def active_pane_id
    _run('list-panes').split("\n").map do |line|
      return line.split[-2] if line =~ /\(active\)/
    end
  end

  def target(args={})
    "#{args.fetch(:session, @session)}:#{args.fetch(:window, @window)}.#{args.fetch(:pane, @pane)}"
  end

  def runner_pane
    if @runner_pane.nil?
      use_nearest_pane = Vim.evaluate('exists("g:VimuxUseNearestPane")') != 0
      if use_nearest_pane && nearest_inactive_pane_id
        _run("select-pane -t #{target(:pane => nearest_inactive_pane_id)}")
      else
        _run("split-window -p #{height} #{orientation}")
      end
      @runner_pane = active_pane_id
      _send_command("cd #{`pwd`}", target(:pane => runner_pane))
      Vim.command("let g:_VimTmuxRunnerPane = '#{@runner_pane}'")
    end

    _run('list-panes').split("\n").map do |line|
      return line.split(':').first if line =~ /#{@runner_pane}/
    end

    @runner_pane = nil
    runner_pane
  end

  def interrupt_runner
    _run("send-keys -t #{target(:pane => runner_pane)} ^c")
  end

  def run_shell_command(command, auto_return = true)
    reset_shell
    _send_command(command, target(:pane => runner_pane), auto_return)
    _move_up_pane
  end

  def close_runner_pane
    _run("kill-pane -t #{target(:pane => runner_pane)}")
  end

  def close_other_panes
    if _run("list-panes").split("\n").length > 1
      _run("kill-pane -a")
    end
  end

  def reset_shell
    _run("send-keys -t #{target(:pane => runner_pane)} #{reset_sequence}")
  end

  def nearest_inactive_pane_id
    panes = _run("list-pane").split("\n")
    pane = panes.find { |p| p !~ /active/ }
    pane ? pane.split(':').first : nil
  end

  def _move_up_pane
    _run("select-pane -t #{target}")
  end

  def _send_command(command, target, auto_return = true)
    _run("send-keys -t #{target} \"#{command.gsub('"', '\"')}\"")
    _run("send-keys -t #{target} Enter") if auto_return
  end

  def _run(command)
    `tmux #{command}`
  end
end

class CurrentTmuxSession < TmuxSession
  def initialize
    if tmux?
      session = self.get_session
      window = self.get_property(:active, :window)
      pane = self.get_property(:active, :pane)

      super(session, window, pane)
    else
      raise "You are not in a tmux session"
    end
  end

  def get_property(match, type)
    _run("list-#{type.to_s}").split("\n").each do |line|
      return line.split(':').first if line =~ /\(#{match.to_s}\)/
    end
  end

  def get_session
    _run("display -p '#S'").strip
  end

  def tmux?
    `echo $TMUX` =~ /.+/ ? true : false
  end
end
EOF
