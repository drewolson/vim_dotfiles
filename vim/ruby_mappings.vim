" Run the current file with rspec
map <Leader>rb :wa<CR> :call RunRubySpec()<CR>
map <Leader>rf :wa<CR> :call RunRubySpec("-l " . line("."))<CR>

" Prompt for a command to run
map <Leader>rp :PromptVimTmuxCommand<CR>

" Run last command executed by RunVimTmuxCommand
map <Leader>rl :wa<CR> :RunLastVimTmuxCommand<CR>

" Inspect runner pane
map <Leader>ri :InspectVimTmuxRunner<CR>

" Close all other tmux panes in current window
map <Leader>rx :CloseVimTmuxWindows<CR>

" Interrupt any command running in the runner pane
map <Leader>re :InterruptVimTmuxRunner<CR>

map <silent> <LocalLeader>rs :!ruby -c %<CR>
map <LocalLeader>rd Orequire 'ruby-debug';debugger<ESC>
setlocal isk+=?

function RunRubySpec(args)
  if system("which rspec > /dev/null; echo $?") == "0\n"
    let l:spec_command = "rspec"
  else
    let l:spec_command = "spec"
  endif
  call RunVimTmuxCommand("clear; " . l:spec_command . " " . bufname("%") . a:args)
endfunction
