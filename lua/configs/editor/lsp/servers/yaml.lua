-- local lsp = vim.lsp.config
--
-- lsp.yamlls = {
--   settings = {
--     yaml = {
--       schemas = {
--         ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
--         -- ["../path/relative/to/file.yml"] = "/.github/workflows/*",
--         -- ["/path/from/root/of/project"] = "/.github/workflows/*",
--       },
--     },
--   },
-- }

vim.lsp.enable('yamlls')