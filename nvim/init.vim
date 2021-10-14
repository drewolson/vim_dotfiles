set nocompatible
syntax on

call plug#begin('~/.config/nvim/plugged')

Plug 'aklt/plantuml-syntax', {'commit': '405186847a44c16dd039bb644541b4c8fbdab095'}
Plug 'andy-morris/alex.vim', {'commit': 'bd95024624b297e212e57582a1ece21ac5dab6b8'}
Plug 'andy-morris/happy.vim', {'commit': '0f2f4719572c0236ff00e2bc8489bbcab8ac8c4f'}
Plug 'andys8/vim-elm-syntax', {'commit': '846a5929bff5795256fbca96707e451dbc755e36'}
Plug 'benmills/vimux', {'commit': '89604a4464c3069dbe31f7bc8dd16a5fbc88a303'} | Plug 'janko-m/vim-test', {'commit': 'b980e646e5f91d6e65659737b584e484ef918984'}
Plug 'cespare/vim-toml', {'commit': 'a4ec206052aa347d7df90dc4b6697b7f2b7929bc'}
Plug 'dense-analysis/ale', {'commit': 'a099fe24b2e898c93c0aa4391e5a5631932684a6'}
Plug 'drewolson/vim-elixir-alternative-files', {'commit': '9c984c852edacccde1071900c698a405dfdae83b'}
Plug 'edwinb/idris2-vim', {'commit': '964cebee493c85f75796e4f4e6bbb4ac54e2da9e'}
Plug 'elixir-editors/vim-elixir', {'commit': '1ad996e64dadf0d2a65c8a079d55a0ad057c08b4'}
Plug 'felipesere/pie-highlight.vim', {'commit': 'b20999e9df5cbdbd00b506aae35655aa97f604db'}
Plug 'gleam-lang/gleam.vim', {'commit': '847a5ef57c2faef2774242c87f711d1131b89fe6'}
Plug 'godlygeek/tabular', {'commit': '339091ac4dd1f17e225fe7d57b48aff55f99b23a'} | Plug 'plasticboy/vim-markdown', {'commit': 'da5a7ac96f517e0fd6f886bc3fbe27156ca1f946'}
Plug 'hrsh7th/cmp-nvim-lsp', {'commit': 'f93a6cf9761b096ff2c28a4f0defe941a6ffffb5'}
Plug 'hrsh7th/nvim-cmp', {'commit': '49acc848531b8cbe051c598dddd0cc46ec64f4b4'}
Plug 'hrsh7th/vim-vsnip', {'commit': '9ac8044206d32bea4dba34e77b6a3b7b87f65df6'}
Plug 'jlanzarotta/bufexplorer', {'commit': '8014787603fff635dfae6afd4dbe9297673a0b39'}
Plug 'jparise/vim-graphql', {'commit': '0858a26d7b3bd263f40b1844829651ea5a577364'}
Plug 'junegunn/fzf', {'tag': '0.27.2', 'dir': '~/.fzf', 'do': './install --bin'} | Plug 'junegunn/fzf.vim', {'commit': 'e34f6c129d39b90db44df1107c8b7dfacfd18946'}
Plug 'junegunn/goyo.vim', {'commit': '6b6ed2734084fdbb6315357ddcaecf9c8e6f143d'}
Plug 'leafgarland/typescript-vim', {'commit': '17d85d8051ba21283e62a9101734981e10b732fd'}
Plug 'maxmellon/vim-jsx-pretty', {'commit': '6989f1663cc03d7da72b5ef1c03f87e6ddb70b41'}
Plug 'monkoose/fzf-hoogle.vim', {'commit': 'v2.2.1', 'for': ['haskell']}
Plug 'nanotech/jellybeans.vim', {'commit': 'v1.7'}
Plug 'neovim/nvim-lspconfig', {'commit': 'e609a702eaf2d6bfb1e0fe8c44a5bf84436fb5a6'}
Plug 'neovimhaskell/haskell-vim', {'commit': 'f35d02204b4813d1dbe8b0e98cc39701a4b8e15e'}
Plug 'ocaml/vim-ocaml', {'commit': '023a2a464e7a096779d3e541ee7d1dbe61148f6a'}
Plug 'pangloss/vim-javascript', {'tag': '1.2.5.1'}
Plug 'purescript-contrib/purescript-vim', {'commit': 'd493b57406d2742f6f6c6545de5a3492f2e5b888'}
Plug 'rodjek/vim-puppet', {'commit': 'd881b93dc4a8ed1374ad44439aeeb47808a6b91a'}
Plug 'rust-lang/rust.vim', {'commit': '87c745d8d506fc1eecc1d81df15d5bde1658a2fc'}
Plug 'scrooloose/nerdtree', {'tag': '6.10.9'}
Plug 'tomtom/tcomment_vim', {'commit': 'b9a075e36e9d8817b15e2edcdb8b6bf51a8d479c'}
Plug 'tpope/vim-fugitive', {'commit': '1c2663f516c32f8453f542be10192a49ee844a93'}
Plug 'tpope/vim-ragtag', {'commit': 'b8966c4f6503a8baaec39e17bd0bf38b2aadc9b2'}
Plug 'tpope/vim-rails', {'commit': '184d12e85a17c85c548aeecc5b5c8c3182bd22e9', 'for': ['ruby', 'rails']}
Plug 'unisonweb/unison', {'commit': '050d309d2baac4b2b5f7a4e047cfd7b4299f33db', 'rtp': 'editor-support/vim'}
Plug 'vim-erlang/vim-erlang-runtime', {'commit': 'f62fa7eb5c17e8fbf93d7dcc5ff593dc534fd44b'}
Plug 'vim-ruby/vim-ruby', {'commit': 'fd49b25e08618b58db678c3f8ce6e443b1ad04e7'}
Plug 'vim-scripts/indentpython.vim', {'commit': '6aaddfde21fe9e7acbe448b92b3cbb67f2fe1fc1'}
Plug 'vmchale/dhall-vim', {'commit': '607958520f8bd4308fe52937e211f6db4ad84cf3'}
Plug 'wlangstroth/vim-racket', {'commit': '32ad23165c96d05da7f3b9931d2889b7e39dcb86'}

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

colorscheme jellybeans

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

let html_use_css=1
let html_number_lines=0
let html_no_pre=1
let g:no_html_toolbar = 'yes'

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

call tcomment#type#Define('unison', '-- %s')

let g:rubycomplete_buffer_loading = 1

let g:go_highlight_trailing_whitespace_error = 0

let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0

let NERDTreeIgnore=['\.pyc$', '\.o$', '\.class$', '\.ibc$', '\.idr\~$', '^__pycache__$']

let $FZF_DEFAULT_COMMAND = 'rg --files'
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_tags_command = 'ctags -R --exclude=".git" --exclude="node_modules" --exclude="vendor" --exclude="log" --exclude="tmp" --exclude="db" --exclude="pkg" --exclude="deps" --exclude="_build" --exclude="output" --extra=+f .'

let g:test#strategy = 'vimux'
let g:test#preserve_screen = 0
let g:test#python#runner = 'pytest'

let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'

let g:hoogle_path = 'stack exec -- hoogle'

let g:ale_linters = {
\  'elixir': ['credo'],
\  'idris': ['idris'],
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

set undodir=~/.config/nvim/undodir
set undofile
set undoreload=10000

lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<LocalLeader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<LocalLeader>cl', '<cmd>lua vim.lsp.codelens.refresh()<CR>', opts)
  buf_set_keymap('n', '<LocalLeader>cr', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)

  vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])

  local cmp = require 'cmp'

  cmp.setup {
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-y>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<C-X><C-O>'] = cmp.mapping.complete(),
    },
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
    },
    completion = {
      autocomplete = false,
    },
  }
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local vanilla_servers = {
  'dhall_lsp_server',
  'elmls',
  'gopls',
  'intelephense',
  'ocamllsp',
  'rust_analyzer',
  'tsserver',
}

for _, lsp in ipairs(vanilla_servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp['purescriptls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    purescript = {
      addSpagoSources = true,
      addNpmPath = true,
      formatter = 'purs-tidy'
    }
  }
}

nvim_lsp['pylsp'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  cmd = { 'poetry', 'run', 'pyls' },
  settings = {
    pyls = {
      enable = true,
      plugins = {
        pyls_mypy = {
          enabled = true,
          live_mode = false
        }
      }
    }
  }
}

nvim_lsp['hls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    haskell = {
      plugin = {
        ['ghcide-completions'] = {
          config = {
            snippetsOn = false
          }
        }
      }
    }
  }
}

nvim_lsp['elixirls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  cmd = { vim.env.HOME .. '/code/elixir-ls/language_server.sh' },
  settings = {
    elixirLS = {
      dialyzerEnabled = false
    }
  }
}
EOF
