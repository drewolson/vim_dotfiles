set nocompatible
syntax on

call plug#begin('~/.vim/plugged')

Plug '~/.vim/local-plugins/color-schemes'
Plug '~/.vim/local-plugins/language-mappings'

Plug 'ElmCast/elm-vim', {'commit': 'ae5315396cd0f3958750f10a5f3ad9d34d33f40d'}
Plug 'benmills/vimux', {'commit': '2285cefee9dfb2139ebc8299d11a6c8c0f21309e'} | Plug 'janko-m/vim-test', {'commit': '062c489781c995f7e81103fec8a3c07bd2ff1f4b'}
Plug 'bkad/CamelCaseMotion', {'commit': '3ae9bf93cce28ddc1f2776999ad516e153769ea4'}
Plug 'cespare/vim-toml', {'commit': 'f6f79f3cc6740dfacca73a195857cbc45e778912'}
Plug 'elixir-editors/vim-elixir', {'commit': '384e84f1bd75ae4a2bd10fef41c8401c493efc8d'} | Plug 'slashmili/alchemist.vim', {'tag': '3.0.0'}
Plug 'fatih/vim-go', {'tag': 'v1.17', 'do': ':GoInstallBinaries'}
Plug 'jparise/vim-graphql', {'tag': '1.1'}
Plug 'jtratner/vim-flavored-markdown', {'commit': '4a70aa2e0b98d20940a65ac38b6e9acc69c6b7a0'}
Plug 'junegunn/fzf', {'tag': '0.17.3', 'dir': '~/.fzf', 'do': './install --bin'} | Plug 'junegunn/fzf.vim', {'commit': 'ce82e10630830bc37a50f706cc3b7216d24e5009'}
Plug 'junegunn/goyo.vim', {'tag': '1.6.0'}
Plug 'mhinz/vim-mix-format', {'commit': '4c9256e28a34c3bba64f645293d05e9457d6927b'}
Plug 'pangloss/vim-javascript', {'tag': '1.2.5.1'}
Plug 'rodjek/vim-puppet', {'commit': 'd881b93dc4a8ed1374ad44439aeeb47808a6b91a'}
Plug 'rust-lang/rust.vim', {'commit': '8e75da9834abb22f8d7ece3f4ca4324a14fa18a6'}
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
Plug 'w0rp/ale', {'tag': 'v1.9.0'}
Plug 'wlangstroth/vim-racket', {'commit': 'f76fde9afbc008b7468c9ea026cbe3840af5f5ef'}

call plug#end()

set background=dark
set backspace=indent,eol,start
set dir=/tmp//
set hidden
set hlsearch
set ignorecase
set incsearch
set mouse=
set nofoldenable
set number
set ruler
set scrolloff=5
set showmatch
set smartcase
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set wildignore+=*.pyc,*.o,*.class
set wrap

autocmd FileType kotlin setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType rust setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType tex setlocal textwidth=80 spell
autocmd Filetype go setlocal noexpandtab
autocmd BufNewFile,BufRead *.txt setlocal textwidth=80 spell
autocmd BufNewFile,BufRead *.md,*.markdown setlocal textwidth=80 filetype=ghmarkdown spell

let html_use_css=1
let html_number_lines=0
let html_no_pre=1

let g:rubycomplete_buffer_loading = 1

let g:no_html_toolbar = 'yes'

let NERDTreeIgnore=['\.pyc$', '\.o$', '\.class$']

let $FZF_DEFAULT_COMMAND = 'find * -type f 2>/dev/null | grep -v -E "deps\/|_build\/|node_modules\/|vendor\/|build_intellij\/"'
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_layout = {'up': '~20%'}
let g:fzf_tags_command = 'ctags -R --exclude=".git" --exclude="node_modules" --exclude="vendor" --exclude="log" --exclude="tmp" --exclude="db" --exclude="pkg" --exclude="deps" --exclude="_build" --extra=+f .'

let test#strategy = 'vimux'

function! ClearTransform(cmd) abort
  return 'clear; ' . a:cmd
endfunction

let g:test#custom_transformations = {'clear': function('ClearTransform')}
let g:test#transformation = 'clear'

let test#python#nose#file_pattern = '_test\.py\|test_.*\.py'
let test#python#runner = 'nose'

let test#go#gotest#executable = 'vgo test -v'

let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'

let g:go_highlight_trailing_whitespace_error = 0
let g:go_template_autocreate = 0

let g:alchemist#elixir_erlang_src = '~/code/alchemist_sources'

let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

let g:rustfmt_autosave = 1

let g:ale_linters = {
\   'rust': ['rustc', 'cargo'],
\}

let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'

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

set undodir=~/.vim/undodir
set undofile
set undoreload=10000
