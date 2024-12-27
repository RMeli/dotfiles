function REQUIRE_PLUGIN(plugin)
  local ok, p = pcall(require, plugin)
  if not ok then
    vim.notify("Requiring '" .. plugin .. "' failed.", "error", { title = "[REQUIRE] " .. plugin })
  end

  return ok, p
end
