-- local status_ok, _ = pcall(require, "lspconfig")
-- if not status_ok then
-- 	return
-- end
--
-- require("user.lsp.handlers").setup()
--
--
--

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require('lspconfig')
local util = require "lspconfig/util"

-- lspconfig.emmet_ls.setup({
--     -- on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'javascript', 'sass', 'scss', 'less' },
--     init_options = {
--       html = {
--         options = {
--           -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--           ["bem.enabled"] = true,
--         },
--       },
--     }
-- })

lspconfig.gopls.setup {
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true,
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
lspconfig.terraformls.setup {
  }

lspconfig.clangd.setup {
    cmd = {"clangd"},
    filetypes = {"c", "cpp", "objc", "objcpp"},
    root_dir = util.root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
        ) }

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
    settings = {
      pyright = {
        autoImportCompletion = true,
      },
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = 'openFilesOnly',
          useLibraryCodeForTypes = true,
          typeCheckingMode = 'on'
        }
      }
    }
}
lspconfig.dockerls.setup{}

lspconfig.tsserver.setup{}
lspconfig.svelte.setup{}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    --
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gf', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
