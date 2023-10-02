vim.wo.relativenumber = true
local core_conf_files = {
  "vim-be-good.vim",
}

for _, file_name in ipairs(core_conf_files) do
    local path = string.format("%s/plugin/%s", vim.fn.stdpath("config"), file_name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd)
end

