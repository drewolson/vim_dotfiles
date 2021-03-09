set nocompatible
syntax on

call plug#begin('~/.vim/plugged')

Plug 'aklt/plantuml-syntax', {'commit': '8dddc45f3f7ba4f0319a14e6f0167d97a703ac55'}
Plug 'andys8/vim-elm-syntax', {'commit': '846a5929bff5795256fbca96707e451dbc755e36'}
Plug 'benmills/vimux', {'commit': '37f41195e6369ac602a08ec61364906600b771f1'} | Plug 'janko-m/vim-test', {'commit': '58dde91c0477fa58d18d5c0fde10b2a60a526b0f'}
Plug 'cespare/vim-toml', {'commit': 'a4ec206052aa347d7df90dc4b6697b7f2b7929bc'}
Plug 'dense-analysis/ale', {'commit': 'v3.0.0'}
Plug 'drewolson/vim-elixir-alternative-files', {'commit': '9c984c852edacccde1071900c698a405dfdae83b'}
Plug 'edwinb/idris2-vim', {'commit': '099129e08c89d9526ad092b7980afa355ddaa24c'}
Plug 'elixir-editors/vim-elixir', {'commit': '1ad996e64dadf0d2a65c8a079d55a0ad057c08b4'}
Plug 'felipesere/pie-highlight.vim', {'commit': 'b20999e9df5cbdbd00b506aae35655aa97f604db'}
Plug 'gleam-lang/gleam.vim', {'commit': '847a5ef57c2faef2774242c87f711d1131b89fe6'}
Plug 'godlygeek/tabular', {'commit': '339091ac4dd1f17e225fe7d57b48aff55f99b23a'} | Plug 'plasticboy/vim-markdown', {'commit': 'da5a7ac96f517e0fd6f886bc3fbe27156ca1f946'}
Plug 'jlanzarotta/bufexplorer', {'commit': '8014787603fff635dfae6afd4dbe9297673a0b39'}
Plug 'jparise/vim-graphql', {'commit': '0858a26d7b3bd263f40b1844829651ea5a577364'}
Plug 'junegunn/fzf', {'tag': '0.25.1', 'dir': '~/.fzf', 'do': './install --bin'} | Plug 'junegunn/fzf.vim', {'commit': '02a192ea0bed22a015e005b281e55e0da2a8e496'}
Plug 'junegunn/goyo.vim', {'commit': '6b6ed2734084fdbb6315357ddcaecf9c8e6f143d'}
Plug 'leafgarland/typescript-vim', {'commit': '17d85d8051ba21283e62a9101734981e10b732fd'}
Plug 'maxmellon/vim-jsx-pretty', {'commit': '6989f1663cc03d7da72b5ef1c03f87e6ddb70b41'}
Plug 'monkoose/fzf-hoogle.vim', {'commit': 'v2.2.1', 'for': ['haskell']}
Plug 'nanotech/jellybeans.vim', {'commit': 'v1.7'}
Plug 'neoclide/coc.nvim', {'commit': '86e80aea782382a0e6d3828b39f5da662cda5222'}
Plug 'neovimhaskell/haskell-vim', {'commit': 'b1ac46807835423c4a4dd063df6d5b613d89c731'}
Plug 'ocaml/vim-ocaml', {'commit': '023a2a464e7a096779d3e541ee7d1dbe61148f6a'}
Plug 'pangloss/vim-javascript', {'tag': '1.2.5.1'}
Plug 'purescript-contrib/purescript-vim', {'commit': '67ca4dc4a0291e5d8c8da48bffc0f3d2c9739e7f'}
Plug 'rodjek/vim-puppet', {'commit': 'd881b93dc4a8ed1374ad44439aeeb47808a6b91a'}
Plug 'rust-lang/rust.vim', {'commit': 'db0137dfad4690621e01dbae780fb4a2dd7dbf27'}
Plug 'scrooloose/nerdtree', {'tag': '6.9.11'}
Plug 'tomtom/tcomment_vim', {'commit': 'b9a075e36e9d8817b15e2edcdb8b6bf51a8d479c'}
Plug 'tpope/vim-fugitive', {'commit': '98f67310aa3ae324d725a3b6b68a63e5a48372f4'}
Plug 'tpope/vim-ragtag', {'commit': '6f1af76cd669c4fb07f0c4e20fdee3077620e3d8'}
Plug 'tpope/vim-rails', {'commit': '184d12e85a17c85c548aeecc5b5c8c3182bd22e9', 'for': ['ruby', 'rails']}
Plug 'unisonweb/unison', {'commit': '050d309d2baac4b2b5f7a4e047cfd7b4299f33db', 'rtp': 'editor-support/vim'}
Plug 'vim-erlang/vim-erlang-runtime', {'commit': 'bba638c6ff658201fd6cd3cacc96cd4c7f63258c'}
Plug 'vim-ruby/vim-ruby', {'commit': 'fd49b25e08618b58db678c3f8ce6e443b1ad04e7'}
Plug 'vim-scripts/indentpython.vim', {'commit': '6aaddfde21fe9e7acbe448b92b3cbb67f2fe1fc1'}
Plug 'vmchale/dhall-vim', {'commit': '607958520f8bd4308fe52937e211f6db4ad84cf3'}
Plug 'wlangstroth/vim-racket', {'commit': 'bca2643c3d8bd0fcd46ab73bee69023a5da1964b'}

call plug#end()

set background=dark
set backspace=indent,eol,start
set backupcopy=yes
set completeopt-=preview
set dir=/tmp//
set hidden
set hlsearch
set ignorecase
set incsearch
set isk+=?
set mouse=
set nobackup
set nofoldenable
set nowritebackup
set number
set ruler
set scrolloff=5
set showmatch
set smartcase
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set updatetime=300
set wildignore+=*.pyc,*.o,*.class
set wrap

colorscheme jellybeans

autocmd BufNewFile,BufRead *.go2 setlocal ft=go
autocmd BufNewFile,BufRead *.md,*.markdown setlocal textwidth=80 spell
autocmd BufNewFile,BufRead *.txt setlocal textwidth=80 spell
autocmd FileType dune setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType elm,kotlin,php,python,rust setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType gitcommit setlocal spell
autocmd FileType go setlocal noexpandtab
autocmd FileType tex setlocal textwidth=80 spell
autocmd Filetype elixir :command! A ElixirAlternateFile()

function! GitGrepWord()
  cgetexpr system("git grep -n '" . expand("<cword>") . "'")
  cwin
  echo 'Number of matches: ' . len(getqflist())
endfunction
command! -nargs=0 GitGrepWord :call GitGrepWord()
nnoremap <silent> <Leader>gw :GitGrepWord<CR>

command! -nargs=0 CocOutputChannel :CocCommand workspace.showOutput
command! -nargs=0 CocImports :call CocAction('runCommand', 'editor.action.organizeImport')

let html_use_css=1
let html_number_lines=0
let html_no_pre=1
let g:no_html_toolbar = 'yes'

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

call tcomment#type#Define('unison', '-- %s')

let g:rubycomplete_buffer_loading = 1

let g:go_highlight_trailing_whitespace_error = 0

let NERDTreeIgnore=['\.pyc$', '\.o$', '\.class$', '\.ibc$', '\.idr\~$', '^__pycache__$']

let $FZF_DEFAULT_COMMAND = 'find * -type f 2>/dev/null | grep -v -E "deps\/|_build\/|node_modules\/|vendor\/|build_intellij\/|output\/|.elixir_ls\/"'
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_tags_command = 'ctags -R --exclude=".git" --exclude="node_modules" --exclude="vendor" --exclude="log" --exclude="tmp" --exclude="db" --exclude="pkg" --exclude="deps" --exclude="_build" --exclude="output" --extra=+f .'

let g:test#strategy = 'vimux'
let g:test#preserve_screen = 0
let g:test#python#runner = 'pytest'
let g:test#python#pytest#executable = 'pipenv run python -m pytest'

let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'

let g:hoogle_path = 'stack exec -- hoogle'

let g:ale_linters = {
\  'elixir': ['credo'],
\  'idris': ['idris'],
\  'javascript': ['eslint'],
\  'racket': ['raco'],
\  'ruby': ['ruby'],
\}

let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'gleam': [{buffer, lines -> {'command': 'gleam format %t', 'read_temporary_file': 1}}],
\  'javascript': ['prettier'],
\  'typescript': ['prettier'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters_explicit = 1
let g:ale_elixir_credo_strict = 1

let ls_langs = 'dhall,elixir,elm,go,haskell,javascript,ocaml,php,purescript,python,rust,typescript'
execute 'autocmd Filetype ' . ls_langs . ' inoremap <silent><expr> <C-X><C-O> coc#refresh()'
execute 'autocmd Filetype ' . ls_langs . ' nmap <C-]> :call CocActionAsync(''jumpDefinition'')<CR>'
execute 'autocmd Filetype ' . ls_langs . ' nnoremap <silent> K :call CocActionAsync(''doHover'')<CR>'

let purescript_indent_case = 2
let purescript_indent_where = 2
let purescript_indent_do = 2

nnoremap <silent> <leader>rf :wa<CR>:TestNearest<CR>
nnoremap <silent> <leader>rb :wa<CR>:TestFile<CR>
nnoremap <silent> <leader>ra :wa<CR>:TestSuite<CR>
nnoremap <silent> <leader>rl :wa<CR>:TestLast<CR>

imap <C-L> <SPACE>=><SPACE>
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git" --exclude="node_modules" --exclude="vendor" --exclude="log" --exclude="tmp" --exclude="db" --exclude="pkg" --exclude="deps" --exclude="_build" --extra=+f .<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <leader>ff :Files<CR>
map <silent> <leader>fg :GFiles<CR>
map <silent> <leader>fb :Buffers<CR>
map <silent> <leader>ft :Tags<CR>
map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>cc :TComment<CR>

nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> Y y$

autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

highlight! CocFloating ctermbg=black

set laststatus=2

set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path

set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

set undodir=~/.vim/undodir
set undofile
set undoreload=10000
