vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})

_G.nvim_lsp = require('lspconfig')

local configs = require('lspconfig.configs')

configs.roc = {
  default_config = {
    cmd = { 'roc_language_server' };
    filetypes = {'roc'};
    root_dir = nvim_lsp.util.root_pattern('.git');
    settings = {};
  }
}

function _G.lsp_on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  local function in_array(needle, haystack)
    for k, v in pairs(haystack) do
      if v == needle then
        return true
      end
    end

    return false
  end

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<LocalLeader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<LocalLeader>cl', '<cmd>lua vim.lsp.codelens.refresh()<CR>', opts)
  buf_set_keymap('n', '<LocalLeader>cr', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)
  buf_set_keymap('n', '<LocalLeader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

  local no_format = {
    'unison',
    'racket_langserver',
  }

  if not in_array(client.name, no_format) then
    vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
  end

  local no_hightlight = {
    'fsautocomplete',
    'roc',
  }

  if in_array(client.name, no_hightlight) then
    client.server_capabilities.semanticTokensProvider = nil
  end

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
  'roc',
  'rust_analyzer',
  'tsserver',
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
  cmd = { vim.env.HOME .. '/code/dotfiles/scripts/pylsp.sh' }
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

require('lean').setup {
  mappings = true,
  lsp = {
    on_attach = _G.lsp_on_attach,
  }
}

require('nvim-treesitter.configs').setup {
  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
  },
}

vim.treesitter.language.register("racket", "pie")

require("catppuccin").setup({
  flavour = "frappe",
  transparent_background = true,
  term_colors = true,
})

vim.cmd.colorscheme("catppuccin")
