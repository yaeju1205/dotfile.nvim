vim.plugin.namespace("yaeju-statusline", function()
    vim.plugin.install("nvim-mini/mini.icons")(function()
        require("mini.icons").setup({
            style = "glyph"
        })

        local icons = require("mini.icons")

        local function highlight_string(hl, str)
            return "%#" .. hl .. "#" .. str .. "%*"
        end

        local file_type_map = {
            ["typescriptreact"] = "tsx",
            ["javascriptreact"] = "jsx",
            ["typescript"] = "ts",
            ["javascript"] = "js",
        }

        vim.statusline = {}
        vim.statusline.render = function()
            local file_name = vim.fn.expand("%:t")
            local file_icon, file_icon_hl = icons.get("file", file_name)

            local file_type = vim.bo.filetype
            if file_type == "" then
                file_type = "text"
            else
                file_type = file_type_map[file_type] or file_type
            end

            local file_icon_text = highlight_string(file_icon_hl, file_icon or "")
            local file_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:.")

            local diag_count = vim.diagnostic.count()
            local error_count, warn_count = diag_count[1], diag_count[2]
            error_count, warn_count = error_count or 0, warn_count or 0

            local branch = vim.b.gitsigns_status_dict
            local branch_text = ""
            if branch and branch.head and branch.head ~= "" then
                branch_text = " " .. branch.head
            end

            return table.concat({
                "  ",
                branch_text,
                "  ",
                file_icon_text .. " " .. file_path,
                "%m%r",
                "%=",
                highlight_string("DiagnosticError", "  " .. error_count),
                "  ",
                highlight_string("DiagnosticWarn", "  " .. warn_count),
                " ",
                " " .. file_icon_text .. " " .. file_type .. " ",
                " %p%% ",
                " %l:%c",
                "  ",
            })
        end

        vim.opt.statusline = "%!v:lua.vim.statusline.render()"
    end)
end)
