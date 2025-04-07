local RG_TOP_CODEBLOCK = '^```%s*%w+'
local checkTextCodeblock = function(text)
  -- check if the text is a code block
  local isCodeblock = text:match(RG_TOP_CODEBLOCK)
  return isCodeblock
end

local getButtomCodeblockMdLine = function()
  local getCurrLineNum = vim.fn.line '.'
  local getEndLineNum = nil ---@type number|nil
  for i = getCurrLineNum, vim.api.nvim_buf_line_count(0) do
    local TEXT = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
    local isMatch = TEXT == '```'
    if isMatch then
      getEndLineNum = i
      break
    end
    if not isMatch and i == vim.api.nvim_buf_line_count(0) then
      getEndLineNum = nil
    end
  end
  return getEndLineNum
end

local getTopCodeblockMdLine = function()
  local getCurrLineNum = vim.fn.line '.'
  local getTopLineNum = nil ---@type number|nil
  for i = getCurrLineNum, 1, -1 do
    local TEXT = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
    local isMatch = TEXT:match(RG_TOP_CODEBLOCK)
    if isMatch then
      getTopLineNum = i
      break
    end
    if not isMatch and i == 1 then
      getTopLineNum = nil
    end
  end
  return getTopLineNum
end

local getCodeblockMd = function()
  -- get current line text
  local CURR_LINE = vim.api.nvim_get_current_line()
  local isCodeblock = checkTextCodeblock(CURR_LINE)

  if isCodeblock then
    local getCurrLineNum = vim.fn.line '.'
    local getEndLineNum = getButtomCodeblockMdLine()
    if getEndLineNum then
      local getText = vim.api.nvim_buf_get_lines(0, getCurrLineNum - 1, getEndLineNum, false)
      local toText = table.concat(getText, '\n')
      return toText
    end
  end

  local total_lines = vim.fn.line '$'
  local isAboveHalf = vim.fn.line '.' > (total_lines / 2)
  if isAboveHalf then
    local BUTTOM_LINE_NUM = getButtomCodeblockMdLine()
    if BUTTOM_LINE_NUM then
      local TOP_LINE_NUM = getTopCodeblockMdLine()
      if TOP_LINE_NUM then
        local getText = vim.api.nvim_buf_get_lines(0, BUTTOM_LINE_NUM - 1, TOP_LINE_NUM, false)
        local toText = table.concat(getText, '\n')
        return toText
      end
    end
  else
    local TOP_LINE_NUM = getTopCodeblockMdLine()
    if TOP_LINE_NUM then
      local BUTTOM_LINE_NUM = getButtomCodeblockMdLine()
      if BUTTOM_LINE_NUM then
        local getText = vim.api.nvim_buf_get_lines(0, TOP_LINE_NUM - 1, BUTTOM_LINE_NUM, false)
        local toText = table.concat(getText, '\n')
        return toText
      end
    end
  end
  return nil
end

_G.MURYP_CODEBLOCK = getCodeblockMd
