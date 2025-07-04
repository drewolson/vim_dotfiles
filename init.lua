-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- setup plugins
require("lazy").setup({
  {
    'MunifTanjim/nui.nvim',
  },
  {
    'aklt/plantuml-syntax',
  },
  {
    'benknoble/vim-racket',
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
  },
  {
    'drewolson/vim-elixir-alternative-files',
  },
  {
    'elixir-editors/vim-elixir',
  },
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    'hrsh7th/nvim-cmp',
  },
  {
    'hrsh7th/vim-vsnip',
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    'nvim-lua/plenary.nvim',
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
  },
  {
    'nvim-telescope/telescope.nvim',
  },
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate'
  },
  {
    'preservim/vimux',
  },
  {
    'tomtom/tcomment_vim',
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'vim-test/vim-test',
  },
})

-- settings
vim.opt.background = 'dark'
vim.opt.backspace = 'indent,eol,start'
vim.opt.backupcopy = 'yes'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.dir = '/tmp//'
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.isk:append('?')
vim.opt.mouse = ''
vim.opt.backup = false
vim.opt.foldenable = false
vim.opt.showcmd = false
vim.opt.writebackup = false
vim.opt.number = true
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.showmatch = true
vim.opt.signcolumn = 'number'
vim.opt.smartcase = true
vim.opt.textwidth = 0
vim.opt.smartindent = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.updatetime = 300
vim.opt.wildignore:append('*.pyc,*.o,*.class')
vim.opt.wrap = true
vim.opt.laststatus = 2
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.opt.undoreload = 10000

-- statusline
vim.opt.statusline = table.concat({
  '%<',
  '%2*[%n%H%M%R%W]%*', -- buffer number, and flags
  '%-40f',             -- relative path
  '%=',                -- seperate between right- and left-aligned
  '%1*%y%*%*',         -- file type
  '%10(L(%l/%L)%)',    -- line
  '%2(C(%v/125)%)',    -- column
  '%P',                -- percentage of file
})


-- autocmds
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'BufNewFile', 'BufRead' }, { pattern = { '*.md', '*.markdown' }, command = 'setlocal textwidth=80 spell' })
autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.txt', command = 'setlocal textwidth=80 spell' })
autocmd('FileType', { pattern = 'dune', command = 'setlocal tabstop=2 shiftwidth=2 softtabstop=2' })
autocmd('FileType',
  { pattern = { 'php', 'python', 'roc', 'rust' }, command = 'setlocal tabstop=4 shiftwidth=4 softtabstop=4' })
autocmd('FileType', { pattern = 'gitcommit', command = 'setlocal spell' })
autocmd('FileType', { pattern = 'go', command = 'setlocal noexpandtab' })
autocmd('FileType', { pattern = 'tex', command = 'setlocal textwidth=80 spell' })
autocmd('FileType', { pattern = 'elixir', command = ':command! A ElixirAlternateFile()' })
autocmd({ 'BufNewFile', 'BufRead' },
  { pattern = '*.p8', command = 'setlocal ft=lua tabstop=1 shiftwidth=1 softtabstop=1' })
autocmd('InsertEnter', { pattern = '*', command = 'match ExtraWhitespace /\\s\\+\\%#\\@<!$/' })
autocmd({ 'BufRead', 'InsertLeave' }, { pattern = '*', command = 'match ExtraWhitespace /\\s\\+$/' })

-- highlight
vim.api.nvim_set_hl(0, 'ExtraWhitespace', { ctermbg = 'red' })

-- variables
vim.g.html_use_css = 1
vim.g.html_number_lines = 0
vim.g.html_no_pre = 1
vim.g.no_html_toolbar = 'yes'
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_new_list_item_indent = 2
vim.g.go_highlight_trailing_whitespace_error = 0
vim.g.VimuxOrientation = 'h'
vim.g.VimuxHeight = '50'
vim.o.winborder = 'single'

vim.cmd([[
  let g:test#strategy = 'vimux'
  let g:test#preserve_screen = 0
  let g:test#python#runner = 'pytest'
  let g:test#python#pytest#executable = 'uv run -m pytest'
]])

-- tcomment
vim.cmd("call tcomment#type#Define('gleam', '// %s')")

-- keymaps
vim.keymap.set('n', '<leader>rf', ':wa<CR>:TestNearest<CR>', { silent = true })
vim.keymap.set('n', '<leader>rb', ':wa<CR>:TestFile<CR>', { silent = true })
vim.keymap.set('n', '<leader>ra', ':wa<CR>:TestSuite<CR>', { silent = true })
vim.keymap.set('n', '<leader>rl', ':wa<CR>:TestLast<CR>', { silent = true })
vim.keymap.set('i', '<C-L>', '<SPACE>=><SPACE>')
vim.keymap.set('n', '<LocalLeader>nt', ':Neotree toggle<CR>', { silent = true })
vim.keymap.set('n', '<LocalLeader>nf', ':Neotree reveal<CR>', { silent = true })
vim.keymap.set('n', '<LocalLeader>ff', '<cmd>Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<LocalLeader>fg', '<cmd>Telescope live_grep<CR>', { silent = true })
vim.keymap.set('n', '<LocalLeader>fb', '<cmd>Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<LocalLeader>nh', ':nohls<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<LocalLeader>cc', ':TComment<CR>', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })
vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'Y', 'y$')

-- treesitter
local treesitter_langs = {
  'gleam',
  'go',
  'haskell',
  'javascript',
  'lua',
  'markdown',
  'ocaml',
  'puppet',
  'python',
  'racket',
  'roc',
  'systemd',
  'toml',
  'typescript',
  'vimscript',
  'yaml',
}

require('nvim-treesitter').install(treesitter_langs)

vim.api.nvim_create_autocmd('FileType', {
  pattern = treesitter_langs,
  callback = function()
    vim.treesitter.start()
  end,
})

-- lsp
_G.nvim_lsp = require('lspconfig')

function _G.lsp_on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function in_array(needle, haystack)
    for _, v in pairs(haystack) do
      if v == needle then
        return true
      end
    end

    return false
  end

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<LocalLeader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<LocalLeader>cl', '<cmd>lua vim.lsp.codelens.refresh()<CR>', opts)
  buf_set_keymap('n', '<LocalLeader>cr', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)
  buf_set_keymap('n', '<LocalLeader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

  local no_format = {
    'unison',
  }

  if not in_array(client.name, no_format) then
    vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
  end

  client.server_capabilities.semanticTokensProvider = nil

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
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  }
end

_G.lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local vanilla_servers = {
  'dhall_lsp_server',
  'elmls',
  'fsautocomplete',
  'gleam',
  'intelephense',
  'nickel_ls',
  'racket_langserver',
  'roc_ls',
  'rust_analyzer',
  'ts_ls',
  'unison',
  'zls',
}

for _, lsp in ipairs(vanilla_servers) do
  _G.nvim_lsp[lsp].setup {
    on_attach = _G.lsp_on_attach,
    capabilities = _G.lsp_capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

_G.nvim_lsp['gopls'].setup {
  on_attach = _G.lsp_on_attach,
  capabilities = _G.lsp_capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    gopls = {
      buildFlags = {
        '-tags=wireinject,tools',
      }
    }
  }
}

_G.nvim_lsp['lua_ls'].setup {
  on_attach = _G.lsp_on_attach,
  capabilities = _G.lsp_capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        telemetry = { enable = false },
        library = {
          vim.env.VIMRUNTIME,
          vim.env.VIMRUNTIME .. '/lua',
          '${3rd}/love2d/library',
        }
      }
    }
  }
}

_G.nvim_lsp['ocamllsp'].setup {
  cmd = { 'opam', 'exe', '--', 'ocamllsp' },
  on_attach = _G.lsp_on_attach,
  capabilities = _G.lsp_capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

_G.nvim_lsp['purescriptls'].setup {
  on_attach = _G.lsp_on_attach,
  capabilities = _G.lsp_capabilities,
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

_G.nvim_lsp['pylsp'].setup {
  on_attach = _G.lsp_on_attach,
  capabilities = _G.lsp_capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  cmd = { 'uv', 'run', 'pylsp' }
}

_G.nvim_lsp['hls'].setup {
  on_attach = _G.lsp_on_attach,
  capabilities = _G.lsp_capabilities,
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
        },
        hlint = {
          globalOn = false
        },
        stan = {
          globalOn = false
        }
      }
    }
  }
}

_G.nvim_lsp['elixirls'].setup {
  on_attach = _G.lsp_on_attach,
  capabilities = _G.lsp_capabilities,
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

-- colorscheme
require('catppuccin').setup({
  flavour = 'frappe',
  transparent_background = true,
  term_colors = true,
  no_italic = true,
})

vim.cmd.colorscheme('catppuccin')

require('nvim-web-devicons').setup({})

-- telescope
require('telescope').setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top"
    },
    mappings = {
      i = {
        ["<C-n>"] = require("telescope.actions").move_selection_next,
        ["<C-p>"] = require("telescope.actions").move_selection_previous,
      },
      n = {
        ["<C-n>"] = require("telescope.actions").move_selection_next,
        ["<C-p>"] = require("telescope.actions").move_selection_previous,
      }
    }
  }
})

-- neo-tree
require('neo-tree').setup({
  window = {
    mappings = {
      ["o"] = "toggle_node",
      ["oc"] = "noop",
      ["od"] = "noop",
      ["og"] = "noop",
      ["om"] = "noop",
      ["on"] = "noop",
      ["os"] = "noop",
      ["ot"] = "noop",
      ["I"] = "toggle_hidden",
    }
  }
})
