local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Fungsi buat insert include
local function add_include(args, state, header)
  local buf = 0
  local lines = vim.api.nvim_buf_get_lines(buf, 0, 50, false)
  local inc_line = "#include " .. header

  for _, l in ipairs(lines) do
    if l == inc_line then return "" end -- udah ada
  end

  vim.api.nvim_buf_set_lines(buf, 0, 0, false, {inc_line, ""})
  return "" -- return kosong biar gak muncul di snippet
end

ls.add_snippets("c", {
  -- s1: SafeMap. Butuh "foo.h"
  s("smap", {
    f(function() return add_include(nil, nil, '"foo.h"') end, {}), -- jalanin fungsi dulu
    t("SafeMap "), i(1, "map"), t(" = SafeMap::ints();"),
  }),

  -- s2: to_json. Butuh 2 header
  s("tojson", {
    f(function() add_include(nil, nil, '"foo.h"') return "" end, {}),
    f(function() add_include(nil, nil, '"json.h"') return "" end, {}),
    t("to_json("), i(1, "data"), t(");"),
  }),

  -- s3: printf. Butuh <stdio.h>
  s("pr", {
    f(function() return add_include(nil, nil, '<stdio.h>') end, {}),
    t('printf("'), i(1), t('");'),
  }),
})