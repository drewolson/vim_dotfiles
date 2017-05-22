set nocompatible
syntax on

if &shell == "/usr/bin/sudosh"
  set shell=/bin/bash
endif

call plug#begin('~/.config/nvim/plugged')

Plug '~/.config/nvim/local-plugins/color-schemes'
Plug '~/.config/nvim/local-plugins/language-mappings'

Plug 'benekastah/neomake', {'commit': '645c433b73f527badaac5e315f1ea16e7d34ef99'}
Plug 'bkad/CamelCaseMotion', {'commit': '3ae9bf93cce28ddc1f2776999ad516e153769ea4'}
Plug 'cespare/vim-toml', {'commit': 'f6f79f3cc6740dfacca73a195857cbc45e778912'}
Plug 'elixir-lang/vim-elixir', {'commit': 'fe7daaaff030e217dffedf53cb5f426099281e3e'} | Plug 'slashmili/alchemist.vim', {'tag': '2.7.0'}
Plug 'fatih/vim-go', {'tag': 'v1.12'}
Plug 'jlanzarotta/bufexplorer', {'tag': 'v7.4.6'}
Plug 'jtratner/vim-flavored-markdown', {'commit': '4a70aa2e0b98d20940a65ac38b6e9acc69c6b7a0'}
Plug 'kassio/neoterm', {'commit': '8da66224b714c442f3f4a7ddfc59507f04555ad3'} | Plug 'benmills/vimux', {'commit': '2285cefee9dfb2139ebc8299d11a6c8c0f21309e'} | Plug 'janko-m/vim-test', {'commit': 'v2.1.0'}
Plug 'lambdatoast/elm.vim', {'commit': '5f8c518cb0c0d3dc9a54a5074b618f897ee34ef9'}
Plug 'pangloss/vim-javascript', {'tag': '1.2.5.1'}
Plug 'rodjek/vim-puppet', {'commit': 'd881b93dc4a8ed1374ad44439aeeb47808a6b91a'}
Plug 'rust-lang/rust.vim', {'commit': '732b5fcb3652f81726d5f0f5b97c9027c01f057a'}
Plug 'scrooloose/nerdtree', {'tag': '5.0.0'}
Plug 'tomtom/tcomment_vim', {'tag': '3.08'}
Plug 'tpope/vim-endwise', {'commit': '0067ceda37725d01b7bd5bf249d63b1b5d4e2ab4', 'for': ['ruby']}
Plug 'tpope/vim-fugitive', {'commit': '008b9570860f552534109b4f618cf2ddd145eeb4'}
Plug 'tpope/vim-ragtag', {'commit': '0ef3f6a5778467fbca12b7874a4509593b209228'}
Plug 'tpope/vim-rails', {'commit': 'abf87ba2ebe07e1a4112a7921c06842070ef2f81'}
Plug 'udalov/kotlin-vim', {'commit': '0b0f27133319aaa83776855aeb32ac620eb99b3f'}
Plug 'vim-erlang/vim-erlang-runtime', {'commit': 'bafee7c69b23cc2923fda9ac16d6f83433645f30'}
Plug 'vim-ruby/vim-ruby', {'commit': '666adb5bcdfb2d21572a58fcdf7545a26bac32a0'}
Plug 'vim-scripts/matchit.zip', {'tag': '1.9'}
Plug 'wlangstroth/vim-racket', {'commit': '6b62e5f50ea94aa41537fb8691abed8f30f4b107'}
Plug 'w0rp/ale', {'tag': 'v1.3.0'}
Plug 'junegunn/fzf', { 'tag': '0.16.7', 'dir': '~/.fzf', 'do': './install --bin' }

call plug#end()

set hlsearch
set number
set showmatch
set incsearch
set background=dark
set hidden
set backspace=indent,eol,start
set ruler
set wrap
set dir=/tmp//
set scrolloff=5
set nofoldenable
set mouse=

set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab

set ignorecase
set smartcase

set wildignore+=*.pyc,*.o,*.class

let html_use_css=1
let html_number_lines=0
let html_no_pre=1

let g:rubycomplete_buffer_loading = 1

let g:no_html_toolbar = 'yes'

let NERDTreeIgnore=['\.pyc$', '\.o$', '\.class$']

let g:fzf_layout = {'up': '~20%'}

let $FZF_DEFAULT_COMMAND = 'find * -type f 2>/dev/null | grep -v -E "deps|_build|node_modules|vendor|build_intellij"'

let test#strategy = "vimux"

function! ClearTransform(cmd) abort
  return 'clear; ' . a:cmd
endfunction

let g:test#custom_transformations = {'clear': function('ClearTransform')}
let g:test#transformation = 'clear'

nnoremap <silent> <leader>rf :wa<CR>:TestNearest<CR>
nnoremap <silent> <leader>rb :wa<CR>:TestFile<CR>
nnoremap <silent> <leader>ra :wa<CR>:TestSuite<CR>
nnoremap <silent> <leader>rl :wa<CR>:TestLast<CR>

let g:neoterm_position = "vertical"
let g:neoterm_size = "100"

let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

nnoremap <silent> <leader>tc :call neoterm#clear()<CR>
nnoremap <silent> <leader>td :call neoterm#close()<CR>

let g:go_highlight_trailing_whitespace_error = 0

let g:alchemist#elixir_erlang_src = "~/code/alchemist_sources"

let g:ale_lint_on_text_changed = "normal"
let g:ale_lint_on_insert_leave = 1

let g:ale_linters = {'java': []}

autocmd FileType kotlin setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType rust setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType tex setlocal textwidth=78
autocmd Filetype go setlocal noexpandtab
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78
autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown

imap <C-L> <SPACE>=><SPACE>
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git" --exclude="log" --exclude="tmp" --exclude="db" --exclude="pkg" --exclude="deps" --exclude="_build" --extra=+f .<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <leader>ff :FZF --reverse<CR>
map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>cc :TComment<CR>

nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> Y y$

if &t_Co == 256
  colorscheme jellybeans
endif

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

set undodir=~/.config/nvim/undodir
set undofile
set undoreload=10000
