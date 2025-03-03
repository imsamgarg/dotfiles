return {
  "dart-lang/dart-vim-plugin",
  config = function()
    vim.g.dart_format_on_save = 1
    vim.g.dart_html_in_string = true
    vim.g.dartfmt_options = { "--fix" }
  end,
  enabled = false,
}
