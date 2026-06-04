local web_devicons = require("nvim-web-devicons")

local name = vim.fn.expand("%:t")
local icon, hl = web_devicons.get_icon(name, nil, { default = true })

local diag_count = vim.diagnostic.count()
vim.opt.statusline = table.concat({
    "  ",
    "%#" .. hl .. "#" .. (icon or "") .. "%*",
    "  ",
    "%t",
    "%m%r",
    "%=",
    "%#" .. "DiagnosticError" .. "#" .. " " .. (diag_count[1] or 0)  .. "%*",
    " ",
    "%#" .. "DiagnosticWarn" .. "#" .. " " .. (diag_count[2] or 0)  .. "%*",
    " ",
    "| %y ",
    "| %p%% ",
    "| %l:%c",
    "  ",
})

