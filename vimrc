set nocompatible
syntax on

call plug#begin('~/.vim/plugged')

Plug 'ElmCast/elm-vim', {'commit': 'd22c0ba13afb554257a8c176962e2216cc18edd1'}
Plug 'benmills/vimux', {'commit': '2285cefee9dfb2139ebc8299d11a6c8c0f21309e'} | Plug 'janko-m/vim-test', {'commit': '3d909e0190a35844aee4eb9684bf9eeecf70888f'}
Plug 'bkad/CamelCaseMotion', {'commit': '3ae9bf93cce28ddc1f2776999ad516e153769ea4'}
Plug 'cespare/vim-toml', {'commit': 'f6f79f3cc6740dfacca73a195857cbc45e778912'}
Plug 'dense-analysis/ale', {'commit': 'dd1e1025b8a9b13cb7966bf2baa3e6b42a862857'}
Plug 'elixir-editors/vim-elixir', {'commit': 'd51d5f7eb5c46992ac718ac648e02e38322e073e'}
Plug 'fatih/vim-go', {'tag': 'v1.18', 'do': ':GoUpdateBinaries'}
Plug 'felipesere/pie-highlight.vim', {'commit': 'b20999e9df5cbdbd00b506aae35655aa97f604db'}
Plug 'gabrielelana/vim-markdown', {'commit': 'd18363153771bdd9c932a217611326c5ce4fd812'}
Plug 'gleam-lang/gleam.vim', {'commit': 'fd4363c0363b856f74a1d6ad33e36b726091f8c6'}
Plug 'idris-hackers/idris-vim', {'commit': '091ed6b267749927777423160eeab520109dd9c1'}
Plug 'jparise/vim-graphql', {'tag': '1.1'}
Plug 'junegunn/fzf', {'tag': '0.17.4', 'dir': '~/.fzf', 'do': './install --bin'} | Plug 'junegunn/fzf.vim', {'commit': 'ce82e10630830bc37a50f706cc3b7216d24e5009'}
Plug 'junegunn/goyo.vim', {'tag': '1.6.0'}
Plug 'leafgarland/typescript-vim', {'commit': '0e9d92eead2df21abe342c4341c55536dd36b0af'}
Plug 'nanotech/jellybeans.vim', {'commit': '36f4f82bd7749928ba4e61a58b2e76effb6ecd66'}
Plug 'neoclide/coc.nvim', {'commit': 'v0.0.74', 'for': ['haskell', 'purescript', 'typescript']}
Plug 'neovimhaskell/haskell-vim', {'commit': 'b1ac46807835423c4a4dd063df6d5b613d89c731'}
Plug 'pangloss/vim-javascript', {'tag': '1.2.5.1'}
Plug 'purescript-contrib/purescript-vim', {'commit': '67ca4dc4a0291e5d8c8da48bffc0f3d2c9739e7f'}
Plug 'rodjek/vim-puppet', {'commit': 'd881b93dc4a8ed1374ad44439aeeb47808a6b91a'}
Plug 'rust-lang/rust.vim', {'commit': '8e75da9834abb22f8d7ece3f4ca4324a14fa18a6'}
Plug 'scrooloose/nerdtree', {'tag': '5.3.3'}
Plug 'tomtom/tcomment_vim', {'tag': '3.08'}
Plug 'tpope/vim-endwise', {'commit': '0067ceda37725d01b7bd5bf249d63b1b5d4e2ab4', 'for': ['ruby']}
Plug 'tpope/vim-fugitive', {'commit': '008b9570860f552534109b4f618cf2ddd145eeb4'}
Plug 'tpope/vim-ragtag', {'commit': '0ef3f6a5778467fbca12b7874a4509593b209228'}
Plug 'tpope/vim-rails', {'commit': 'abf87ba2ebe07e1a4112a7921c06842070ef2f81'}
Plug 'udalov/kotlin-vim', {'commit': '0b0f27133319aaa83776855aeb32ac620eb99b3f'}
Plug 'unisonweb/unison', {'commit': '5ca8523dacb79014364b5df67e3c148745d8fd56', 'rtp': 'editor-support/vim'}
Plug 'vim-erlang/vim-erlang-runtime', {'commit': 'bafee7c69b23cc2923fda9ac16d6f83433645f30'}
Plug 'vim-ruby/vim-ruby', {'commit': '666adb5bcdfb2d21572a58fcdf7545a26bac32a0'}
Plug 'vim-scripts/indentpython.vim', {'commit': '6aaddfde21fe9e7acbe448b92b3cbb67f2fe1fc1'}
Plug 'vim-scripts/matchit.zip', {'tag': '1.9'}
Plug 'wlangstroth/vim-racket', {'commit': '164d93736d5cee79c77d4a8a3f722ef31d8d2f4c'}

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
autocmd FileType kotlin setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType rust setlocal tabstop=4 shiftwidth=4 softtabstop=4
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

let $FZF_DEFAULT_COMMAND = 'find * -type f 2>/dev/null | grep -v -E "deps\/|_build\/|node_modules\/|vendor\/|build_intellij\/"'
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_tags_command = 'ctags -R --exclude=".git" --exclude="node_modules" --exclude="vendor" --exclude="log" --exclude="tmp" --exclude="db" --exclude="pkg" --exclude="deps" --exclude="_build" --extra=+f .'

let g:test#strategy = 'vimux'
let g:test#preserve_screen = 0
let g:test#python#nose#file_pattern = '_test\.py\|test_.*\.py'
let g:test#python#runner = 'nose'

let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'

let g:go_template_autocreate = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:ale_linters = {
\   'rust': ['rustc', 'cargo'],
\   'go': ['gobuild'],
\   'ruby': ['ruby'],
\   'idris': ['idris'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'elixir': ['mix_format'],
\   'go': ['gofmt', 'goimports'],
\   'rust': ['rustfmt'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters_explicit = 1

let ls_langs = 'haskell,purescript,typescript'
execute 'autocmd Filetype ' . ls_langs . ' inoremap <silent><expr> <C-X><C-O> coc#refresh()'
execute 'autocmd Filetype ' . ls_langs . ' nmap <C-]> <Plug>(coc-definition)'
execute 'autocmd Filetype ' . ls_langs . ' nnoremap <silent> K :call CocAction(''doHover'')<CR>'

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
