if !exists('g:test#gleam#unitest#file_pattern')
  let g:test#gleam#unitest#file_pattern = '\v\.gleam$'
endif

function! test#gleam#unitest#test_file(file) abort
  return a:file =~# g:test#gleam#unitest#file_pattern
endfunction

function! test#gleam#unitest#build_position(type, position) abort
  if a:type ==# 'nearest'
    return ['test', a:position['file'].':'.a:position['line']]
  elseif a:type ==# 'file'
    return ['test', a:position['file']]
  else
    return []
  endif
endfunction

function! test#gleam#unitest#build_args(args)
  if empty(filter(copy(a:args), 'test#base#file_exists(v:val)'))
    call add(a:args, 'test')
  endif

  return a:args
endfunction

function! test#gleam#unitest#executable() abort
  return 'gleam'
endfunction

function! s:nearest_test(position) abort
  let patterns = {
    \ 'whole_match': 1,
    \ 'test': [
      \ '\v^\s*fn (.*_test)',
    \],
    \ 'namespace': []
  \}

  let name = test#base#nearest_test(a:position, patterns)

  return test#base#escape_regex(join(name['test']))
endfunction
