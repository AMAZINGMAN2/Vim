local M = {}

function M.setup()
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            local ok, mark = pcall(require, "harpoon.mark")
            if not ok then return end

            local file = mark.get_marked_file_name(1)
            if not file or file == "" then return end

            vim.schedule(function()
                if vim.fn.expand("%") == "" then
                    vim.cmd("edit " .. vim.fn.fnameescape(file))
                end
            end)
        end,
    })
end

return M
