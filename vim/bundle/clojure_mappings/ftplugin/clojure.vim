" start the lein repl
map <silent> <LocalLeader>vr :call RunVimTmuxCommand("clear && lein repl")<CR>

" run test form under cursor by
"   - marking the current line
"   - jump to top and send namespace form to repl
"   - jump back to current line
"   - send that form to repl
"   - send (run-tests) to repl
map <silent> <LocalLeader>vf :wa<CR> mvgg<LocalLeader>vs 'v <LocalLeader>vs :call RunVimTmuxCommand("(run-tests)")<CR>
