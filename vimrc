set nocompatible
syntax on

call plug#begin('~/.vim/plugged')

Plug 'andys8/vim-elm-syntax', {'commit': '846a5929bff5795256fbca96707e451dbc755e36'}
Plug 'benmills/vimux', {'commit': '37f41195e6369ac602a08ec61364906600b771f1'} | Plug 'janko-m/vim-test', {'commit': '330b0911f13bcb48a3e28dedcf71e19de5bd4864'}
Plug 'bkad/CamelCaseMotion', {'commit': 'de439d7c06cffd0839a29045a103fe4b44b15cdc'}
Plug 'cespare/vim-toml', {'commit': 'a4ec206052aa347d7df90dc4b6697b7f2b7929bc'}
Plug 'dense-analysis/ale', {'commit': 'd6d2a0c77010db6a75a8942e2af9606971738c23'}
Plug 'elixir-editors/vim-elixir', {'commit': '95a0e08e9bc3ebb3d2606c83b06cef3db4092337'}
Plug 'felipesere/pie-highlight.vim', {'commit': 'b20999e9df5cbdbd00b506aae35655aa97f604db'}
Plug 'gabrielelana/vim-markdown', {'commit': 'd18363153771bdd9c932a217611326c5ce4fd812'}
Plug 'idris-hackers/idris-vim', {'commit': '091ed6b267749927777423160eeab520109dd9c1'}
Plug 'jlanzarotta/bufexplorer', {'commit': '8014787603fff635dfae6afd4dbe9297673a0b39'}
Plug 'jparise/vim-graphql', {'commit': '0858a26d7b3bd263f40b1844829651ea5a577364'}
Plug 'junegunn/fzf', {'tag': '0.20.0', 'dir': '~/.fzf', 'do': './install --bin'} | Plug 'junegunn/fzf.vim', {'commit': '467c3277884240f7b5430f8f4d600e3415c38f3b'}
Plug 'junegunn/goyo.vim', {'commit': '6b6ed2734084fdbb6315357ddcaecf9c8e6f143d'}
Plug 'leafgarland/typescript-vim', {'commit': '17d85d8051ba21283e62a9101734981e10b732fd'}
Plug 'nanotech/jellybeans.vim', {'commit': 'ef83bf4dc8b3eacffc97bf5c96ab2581b415c9fa'}
Plug 'neoclide/coc.nvim', {'commit': '9c3c73a77dfa0c31cfea2063b0dacd59dcf8e1ee', 'for': ['dhall', 'elixir', 'elm', 'go', 'haskell', 'purescript', 'rust', 'typescript']}
Plug 'neovimhaskell/haskell-vim', {'commit': 'b1ac46807835423c4a4dd063df6d5b613d89c731'}
Plug 'pangloss/vim-javascript', {'tag': '1.2.5.1'}
Plug 'purescript-contrib/purescript-vim', {'commit': '67ca4dc4a0291e5d8c8da48bffc0f3d2c9739e7f'}
Plug 'rodjek/vim-puppet', {'commit': 'd881b93dc4a8ed1374ad44439aeeb47808a6b91a'}
Plug 'rust-lang/rust.vim', {'commit': 'db0137dfad4690621e01dbae780fb4a2dd7dbf27'}
Plug 'scrooloose/nerdtree', {'tag': '6.6.1'}
Plug 'tomtom/tcomment_vim', {'commit': '239c0c08d3e691a2c447278b88de91b602fa50bd'}
Plug 'tpope/vim-endwise', {'commit': 'bf90d8be447de667f4532b934d1a70881be56dd8', 'for': ['ruby']}
Plug 'tpope/vim-fugitive', {'commit': '98f67310aa3ae324d725a3b6b68a63e5a48372f4'}
Plug 'tpope/vim-ragtag', {'commit': '6f1af76cd669c4fb07f0c4e20fdee3077620e3d8'}
Plug 'tpope/vim-rails', {'commit': '64befc6187678893082bebb8be79c1d17fdd07ba'}
Plug 'unisonweb/unison', {'commit': '872c8e9ddffd864ab6e4f4866d5713041bf80d4a', 'rtp': 'editor-support/vim'}
Plug 'vim-erlang/vim-erlang-runtime', {'commit': 'bba638c6ff658201fd6cd3cacc96cd4c7f63258c'}
Plug 'vim-ruby/vim-ruby', {'commit': 'fbf85d106a2c3979ed43d6332b8c26a72542754d'}
Plug 'vim-scripts/indentpython.vim', {'commit': '6aaddfde21fe9e7acbe448b92b3cbb67f2fe1fc1'}
Plug 'vim-scripts/matchit.zip', {'tag': '1.13.2'}
Plug 'vmchale/dhall-vim', {'commit': '607958520f8bd4308fe52937e211f6db4ad84cf3'}
Plug 'wlangstroth/vim-racket', {'commit': '65e6e61e4492fefdddd992158d784cc751401590'}

call plug#end()

set background=dark
set backspace=indent,eol,start
set completeopt-=preview
set dir=/tmp//
set hidden
set hlsearch
set ignorecase
set incsearch
set isk+=?
set mouse=
set nofoldenable
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

autocmd BufNewFile,BufRead *.md,*.markdown setlocal textwidth=80 spell
autocmd BufNewFile,BufRead *.txt setlocal textwidth=80 spell
autocmd FileType go setlocal noexpandtab
autocmd FileType elm,kotlin,php,python,rust setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType tex setlocal textwidth=80 spell

function! GitGrepWord()
  cgetexpr system("git grep -n '" . expand("<cword>") . "'")
  cwin
  echo 'Number of matches: ' . len(getqflist())
endfunction
command! -nargs=0 GitGrepWord :call GitGrepWord()
nnoremap <silent> <Leader>gw :GitGrepWord<CR>

let html_use_css=1
let html_number_lines=0
let html_no_pre=1

let g:rubycomplete_buffer_loading = 1

let g:no_html_toolbar = 'yes'

let NERDTreeIgnore=['\.pyc$', '\.o$', '\.class$', '\.ibc$', '\.idr\~$']

let $FZF_DEFAULT_COMMAND = 'find * -type f 2>/dev/null | grep -v -E "deps\/|_build\/|node_modules\/|vendor\/|build_intellij\/|output\/"'
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_tags_command = 'ctags -R --exclude=".git" --exclude="node_modules" --exclude="vendor" --exclude="log" --exclude="tmp" --exclude="db" --exclude="pkg" --exclude="deps" --exclude="_build" --exclude="output" --extra=+f .'

let g:test#strategy = 'vimux'
let g:test#preserve_screen = 0
let g:test#python#runner = 'pytest'
let g:test#python#pytest#executable = '.venv/bin/python -m pytest'

let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'

let g:ale_linters = {
\   'idris': ['idris'],
\   'racket': ['raco'],
\   'ruby': ['ruby'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['prettier'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters_explicit = 1

let ls_langs = 'dhall,elixir,elm,go,haskell,purescript,rust,typescript'
execute 'autocmd Filetype ' . ls_langs . ' inoremap <silent><expr> <C-X><C-O> coc#refresh()'
execute 'autocmd Filetype ' . ls_langs . ' nmap <C-]> <Plug>(coc-definition)'
execute 'autocmd Filetype ' . ls_langs . ' nnoremap <silent> K :call CocAction(''doHover'')<CR>'
execute 'autocmd Filetype ' . ls_langs . ' nnoremap <silent> <leader>fa :call CocAction(''format'')<CR>'

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
