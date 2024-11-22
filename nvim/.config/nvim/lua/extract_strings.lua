function Process_file(file, query, language)
  local bufnr = vim.fn.bufadd(file)
  local ts = vim.treesitter
  local ts_query = require("vim.treesitter.query")
  local parser = ts.get_parser(bufnr, language)
  local tree = parser:parse()[1]

  local results = {}
  local query_obj = ts_query.parse(language, query)

  for _, match, _ in query_obj:iter_matches(tree:root(), bufnr, 0, -1) do
    for _, node in pairs(match) do
      local name = ts.get_node_text(node, bufnr)
      table.insert(results, name)
    end
  end

  vim.api.nvim_buf_delete(bufnr, { force = true })
  return results
end

function Process_Directory(directory, query, language)
  local Path = require("plenary.path")
  local scan = require("plenary.scandir")
  local files = scan.scan_dir(directory, { hidden = false, add_dirs = false })

  local all_results = {}

  for i, file in ipairs(files) do
    if string.match(file, "test") or string.match(file, "g.dart") or string.match(file, "freezed.dart") then
      goto continue
    end

    if string.match(file, "view.dart") or string.match(file, "page.dart") or string.match(file, "card.dart") then
      local file_results = Process_file(file, query, language)
      for _, result in ipairs(file_results) do
        table.insert(all_results, result)
      end
    end
    ::continue::
  end
  return all_results
end

function Extract_strings_from_dart_project()
  local strings_query = [[
(
(string_literal) @string_literal
 )
  ]]

  -- current directory
  local results = Process_Directory(".", strings_query, "dart")
  -- save it in a file name strings.txt
  local file = io.open("strings.txt", "w")
  if not file then
    print("Error opening file")
    return
  end
  for _, result in ipairs(results) do
    -- dont save result which has package: and dart: imports
    if string.match(result, "package:") or string.match(result, "dart:") or string.match(result, ".dart") then
      goto continue
    end

    file:write(result .. "\n")
    ::continue::
  end
  print("Strings extracted and saved in strings.txt")
end
-- Example usage:
-- local bufnr = vim.api.nvim_get_current_buf()
-- local function_names = extract_strings(bufnr)
-- print(vim.inspect(function_names))
vim.api.nvim_create_user_command("ExtractStrings", Extract_strings_from_dart_project, {})
