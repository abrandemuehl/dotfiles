-- Define a function to check if the current buffer is showing a declaration
local function is_declaration()
  local params = lsp.util.make_position_params()
  local result = lsp.buf_request_sync(0, "textDocument/declaration", params, 1000)

  if result and result[1] then
      local declaration = result[1].result
      if declaration then
          -- Check if the position matches the current cursor position
          local cursor_pos = vim.api.nvim_win_get_cursor(0)
          local declaration_start = declaration.range.start
          local declaration_end = declaration.range['end']
          if cursor_pos[1] == declaration_start.line + 1
                  and cursor_pos[2] >= declaration_start.character
                  and cursor_pos[2] <= declaration_end.character then
              return true
          end
      end
  end

  return false
end


-- Define functions to handle the key mappings
local M = {}

function M.go_to()
    -- Check if it's a declaration
    if is_declaration() then
        vim.cmd('normal! <cmd>lua vim.lsp.buf.definition()<CR>')
    else
        vim.cmd('normal! <cmd>lua vim.lsp.buf.declaration()<CR>')
    end
end

return M
