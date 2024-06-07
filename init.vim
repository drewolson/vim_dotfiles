set nocompatible
syntax on

call plug#begin('~/.config/nvim/plugged')

Plug 'ChrisWellsWood/roc.vim', {'commit': 'a4b2edc029b349f05221249a6ab922d2787d2962'}
Plug 'Julian/lean.nvim', {'commit': '6ac7bea0ba95a93745ebc7b89dfc940e6e70bd14'}
Plug 'adelarsq/neofsharp.vim', {'commit': 'b8f7532bc7311a8e896ffd5d83790887163fac05'}
Plug 'aklt/plantuml-syntax', {'commit': '44054d6d2cbcf01a064858faa3364cd30d38057d'}
Plug 'andy-morris/alex.vim', {'commit': 'bd95024624b297e212e57582a1ece21ac5dab6b8'}
Plug 'andy-morris/happy.vim', {'commit': '0f2f4719572c0236ff00e2bc8489bbcab8ac8c4f'}
Plug 'benknoble/vim-racket', {'commit': 'c21569c65fe690c7ad6e88313df8a642fc6531ec'}
Plug 'catppuccin/nvim', {'commit': 'd97387aea8264f484bb5d5e74f2182a06c83e0d8', 'as': 'catppuccin'}
Plug 'cespare/vim-toml', {'commit': '717bd87ef928293e0cc6cfc12ebf2e007cb25311'}
Plug 'dense-analysis/ale', {'commit': '31dc6a61a07839ea906f6f0b80be713fb8cad1c7'}
Plug 'drewolson/vim-elixir-alternative-files', {'commit': '9c984c852edacccde1071900c698a405dfdae83b'}
Plug 'edwinb/idris2-vim', {'commit': '964cebee493c85f75796e4f4e6bbb4ac54e2da9e'}
Plug 'elixir-editors/vim-elixir', {'commit': '1ad996e64dadf0d2a65c8a079d55a0ad057c08b4'}
Plug 'godlygeek/tabular', {'commit': '339091ac4dd1f17e225fe7d57b48aff55f99b23a'} | Plug 'plasticboy/vim-markdown', {'commit': '8e5d86f7b85234d3d1b4207dceebc43a768ed5d4'}
Plug 'hrsh7th/cmp-nvim-lsp', {'commit': '5af77f54de1b16c34b23cba810150689a3a90312'}
Plug 'hrsh7th/nvim-cmp', {'commit': 'ce16de5665c766f39c271705b17fff06f7bcb84f'}
Plug 'hrsh7th/vim-vsnip', {'commit': '9ac8044206d32bea4dba34e77b6a3b7b87f65df6'}
Plug 'jlanzarotta/bufexplorer', {'commit': '99557c451ff6ed3bbb9b9f6215ad57e919740635'}
Plug 'jparise/vim-graphql', {'commit': '9a9fe186a73fce636398ee7f851466ef60c9fde5'}
Plug 'junegunn/fzf', {'tag': '0.53.0', 'dir': '~/.fzf', 'do': './install --bin'} | Plug 'junegunn/fzf.vim', {'commit': '279e1ec068f526e985ee7e3f62a71f083bbe0196'}
Plug 'junegunn/goyo.vim', {'commit': 'fa0263d456dd43f5926484d1c4c7022dfcb21ba9'}
Plug 'leafgarland/typescript-vim', {'commit': '67e81e4292186889a1a519e1bf3a600d671237eb'}
Plug 'neovim/nvim-lspconfig', {'commit': '92166b89ab4b3d60f24e58170cac53b7141fd032'}
Plug 'neovimhaskell/haskell-vim', {'commit': 'f35d02204b4813d1dbe8b0e98cc39701a4b8e15e'}
Plug 'nvim-lua/plenary.nvim', {'commit': '50012918b2fc8357b87cff2a7f7f0446e47da174'}
Plug 'nvim-treesitter/nvim-treesitter', {'commit': '3a74b5831058d0daf8952a5b8c556c61b30a3f46', 'do': ':TSUpdate'}
Plug 'preservim/nerdtree', {'commit': 'fbb71fcd90602e3ec77f40b864b5f9b437c496c5'}
Plug 'preservim/vimux', {'commit': 'f7c41607d9246ec4b6cc28587cce84d75d106e3e'} | Plug 'vim-test/vim-test', {'commit': '46d2067586b788e2194e812bbfdbb2061b93a5ee'}
Plug 'tomtom/tcomment_vim', {'commit': '5c5c31121ec607011c1e382163c0bce207ac2966'}
Plug 'tpope/vim-fugitive', {'commit': 'cd67d087df560a2cbf02cf74fbb937797d4ae797'}
Plug 'unisonweb/unison', { 'tag': 'release/0.5.21', 'rtp': 'editor-support/vim' }

call plug#end()

set background=dark
set backspace=indent,eol,start
set backupcopy=yes
set completeopt=menu,menuone,noselect
set dir=/tmp//
set exrc
set hidden
set hlsearch
set ignorecase
set incsearch
set isk+=?
set mouse=
set nobackup
set nofoldenable
set noshowcmd
set nowritebackup
set number
set ruler
set scrolloff=5
set showmatch
set signcolumn=number
set smartcase
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set updatetime=300
set wildignore+=*.pyc,*.o,*.class
set wrap

autocmd BufNewFile,BufRead *.md,*.markdown setlocal textwidth=80 spell
autocmd BufNewFile,BufRead *.txt setlocal textwidth=80 spell
autocmd FileType dune setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType elm,kotlin,php,python,rust setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType gitcommit setlocal spell
autocmd FileType go setlocal noexpandtab
autocmd FileType tex setlocal textwidth=80 spell
autocmd Filetype elixir :command! A ElixirAlternateFile()
autocmd BufNewFile,BufRead *.p8 setlocal ft=lua tabstop=1 shiftwidth=1 softtabstop=1
autocmd BufNewFile,BufRead *.pie setlocal ft=racket

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
let g:no_html_toolbar = 'yes'

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

call tcomment#type#Define('unison', '-- %s')

let g:go_highlight_trailing_whitespace_error = 0

let g:python3_host_prog  = '~/.asdf/shims/python3'
let g:python_host_prog  = '/usr/bin/python2'

let NERDTreeIgnore=['\.pyc$', '\.o$', '\.class$', '\.ibc$', '\.idr\~$', '^__pycache__$']

let $FZF_DEFAULT_COMMAND = 'rg --files'
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_tags_command = 'ctags -R --exclude=".git" --exclude="node_modules" --exclude="vendor" --exclude="log" --exclude="tmp" --exclude="db" --exclude="pkg" --exclude="deps" --exclude="_build" --exclude="output" --extra=+f .'

let g:test#strategy = 'vimux'
let g:test#preserve_screen = 0
let g:test#python#runner = 'pytest'

let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'

let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters_explicit = 1

nnoremap <silent> <leader>rf :wa<CR>:TestNearest<CR>
nnoremap <silent> <leader>rb :wa<CR>:TestFile<CR>
nnoremap <silent> <leader>ra :wa<CR>:TestSuite<CR>
nnoremap <silent> <leader>rl :wa<CR>:TestLast<CR>

imap <C-L> <SPACE>=><SPACE>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>ff :Files<CR>
map <silent> <LocalLeader>fg :GFiles<CR>
map <silent> <LocalLeader>fb :Buffers<CR>
map <silent> <LocalLeader>ft :Tags<CR>
map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>cc :TComment<CR>

nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> Y y$

autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red

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

lua require('config')
