set nocompatible
syntax on

call plug#begin('~/.config/nvim/plugged')

Plug 'ChrisWellsWood/roc.vim', {'commit': 'a4b2edc029b349f05221249a6ab922d2787d2962'}
Plug 'nvim-lua/plenary.nvim', {'commit': '857c5ac632080dba10aae49dba902ce3abf91b35'} | Plug 'Julian/lean.nvim', {'commit': '166b941f72ce399df8063c113514e4ecbfb316e6'}
Plug 'adelarsq/neofsharp.vim', {'commit': 'b8f7532bc7311a8e896ffd5d83790887163fac05'}
Plug 'aklt/plantuml-syntax', {'commit': '44054d6d2cbcf01a064858faa3364cd30d38057d'}
Plug 'andy-morris/alex.vim', {'commit': 'bd95024624b297e212e57582a1ece21ac5dab6b8'}
Plug 'andy-morris/happy.vim', {'commit': '0f2f4719572c0236ff00e2bc8489bbcab8ac8c4f'}
Plug 'benknoble/vim-racket', {'commit': '0ca759ec409a8d3dd85e49c0b8eb429cc88a4964'}
Plug 'catppuccin/nvim', {'commit': '5b5e3aef9ad7af84f463d17b5479f06b87d5c429', 'as': 'catppuccin'}
Plug 'drewolson/vim-elixir-alternative-files', {'commit': '9c984c852edacccde1071900c698a405dfdae83b'}
Plug 'elixir-editors/vim-elixir', {'commit': '1ec9aab0e0de9c737af97e46ead5d65485ae2f9a'}
Plug 'hrsh7th/cmp-nvim-lsp', {'commit': '99290b3ec1322070bcfb9e846450a46f6efa50f0'}
Plug 'hrsh7th/nvim-cmp', {'commit': '1e1900b0769324a9675ef85b38f99cca29e203b3'}
Plug 'hrsh7th/vim-vsnip', {'commit': '02a8e79295c9733434aab4e0e2b8c4b7cea9f3a9'}
Plug 'junegunn/fzf', {'tag': 'v0.60.3'} | Plug 'junegunn/fzf.vim', {'commit': '556f45e79ae5e3970054fee4c4373472604a1b4e'}
Plug 'neovim/nvim-lspconfig', {'tag': 'v1.7.0'}
Plug 'nvim-treesitter/nvim-treesitter', {'commit': '38959800c2439c890e3238af559f0dc3be45e393', 'do': ':TSUpdate'}
Plug 'preservim/nerdtree', {'tag': '7.1.3'}
Plug 'preservim/vimux', {'commit': '7db6b2f79d432ee3820668b1d4625311dbe1d0ad'} | Plug 'vim-test/vim-test', {'commit': '0f50a546aef59efe5f1301de8fa9819ecb9fd482'}
Plug 'tomtom/tcomment_vim', {'commit': '48ab639a461d9b8344f7fee06cb69b4374863b13'}
Plug 'tpope/vim-fugitive', {'commit': '4a745ea72fa93bb15dd077109afbb3d1809383f2'}

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

call tcomment#type#Define('gleam', '// %s')

let g:go_highlight_trailing_whitespace_error = 0

let g:python3_host_prog  = '~/.asdf/shims/python3'
let g:python_host_prog  = '/usr/bin/python2'

let NERDTreeIgnore=['\.pyc$', '\.o$', '\.class$', '\.ibc$', '\.idr\~$', '^__pycache__$']

let $FZF_DEFAULT_COMMAND = 'rg --files'
let $FZF_DEFAULT_OPTS = '--reverse'

let g:test#strategy = 'vimux'
let g:test#preserve_screen = 0
let g:test#python#runner = 'pytest'
let g:test#python#pytest#executable = 'pytest'

let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'

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
