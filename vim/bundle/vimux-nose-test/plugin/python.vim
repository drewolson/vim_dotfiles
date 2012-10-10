if exists("g:loaded_vimux_nose_test") || &cp
  finish
endif
let g:loaded_vimux_nose_test = 1

if !has("ruby")
  finish
end

command RunAllNoseTests :call s:RunAllNoseTests()
command RunFocusedNoseTests :call s:RunFocusedNoseTests()

function s:RunAllNoseTests()
  ruby NoseTest.new.run_all
endfunction

function s:RunFocusedNoseTests()
  ruby NoseTest.new.run_focused
endfunction

ruby << EOF
module VIM
  class Buffer
    def method_missing(method, *args, &block)
      VIM.command "#{method} #{self.name}"
    end
  end
end

class NoseTest
  def current_file
    VIM::Buffer.current.name
  end

  def line_number
    VIM::Buffer.current.line_number
  end

  def virtualenv
    if Vim.evaluate('exists("g:NoseVirtualenv")') != 0
      ". #{Vim.evaluate('g:NoseVirtualenv')} && "
    else
      ""
    end
  end

  def run_all
    send_to_vimux("#{virtualenv} nosetests '#{current_file}'")
  end

  def run_focused
    send_to_vimux("#{virtualenv} noseline '#{current_file}' --line #{line_number}")
  end

  def send_to_vimux(test_command)
    Vim.command("call RunVimTmuxCommand(\"clear && #{test_command}\")")
  end
end
EOF
