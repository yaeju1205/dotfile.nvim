vim.plugin.namespace("yaeju-search", function()
    vim.plugin.install("kevinhwang91/nvim-hlslens")(function()
        local hlslens = require("hlslens")
        hlslens.setup()

        local function hlslens_next_element()
            pcall(function()
                vim.cmd("normal! " .. vim.v.count1 .. "n")
            end)
            hlslens.start()
        end

        local function hlslens_prev_element()
            pcall(function()
                vim.cmd("normal! " .. vim.v.count1 .. "N")
            end)
            hlslens.start()
        end

        vim.keymap.set("n", "n", hlslens_next_element, { silent = true, noremap = true })
        vim.keymap.set("n", "N", hlslens_prev_element, { silent = true, noremap = true })
        vim.keymap.set("n", "*", hlslens.start, { silent = true, noremap = true })
        vim.keymap.set("n", "#", hlslens.start, { silent = true, noremap = true })
        vim.keymap.set("n", "g*", hlslens.start, { silent = true, noremap = true })
        vim.keymap.set("n", "g#", hlslens.start, { silent = true, noremap = true })
    end)

    vim.plugin.install("hedyhli/outline.nvim")(function()
        vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

        require("outline").setup({
            symbols = {
                filter = nil,
                icon_source = nil,
                icon_fetcher = nil,
                icons = {
                    File =          { icon = "󰈔", hl = "Identifier" },
                    Module =        { icon = "󰆧", hl = "Include" },
                    Namespace =     { icon = "󰅪", hl = "Include" },
                    Package =       { icon = "󰏗", hl = "Include" },
                    Class =         { icon = "", hl = "Type" },
                    Method =        { icon = "", hl = "Function" },
                    Property =      { icon = "", hl = "Identifier" },
                    Field =         { icon = "󰆨", hl = "Identifier" },
                    Constructor =   { icon = "", hl = "Special" },
                    Enum =          { icon = "ℰ", hl = "Type" },
                    Interface =     { icon = "󰜰", hl = "Type" },
                    Function =      { icon = "󰆧", hl = "Function" },
                    Variable =      { icon = "󰆧", hl = "Constant" },
                    Constant =      { icon = "󰆧", hl = "Constant" },
                    String =        { icon = "𝓐", hl = "String" },
                    Number =        { icon = "#", hl = "Number" },
                    Boolean =       { icon = "⊨", hl = "Boolean" },
                    Array =         { icon = "󰅪", hl = "Constant" },
                    Object =        { icon = "⦿", hl = "Type" },
                    Key =           { icon = "🔐", hl = "Type" },
                    Null =          { icon = "NULL", hl = "Type" },
                    EnumMember =    { icon = "", hl = "Identifier" },
                    Struct =        { icon = "", hl = "Structure" },
                    Event =         { icon = "🗲", hl = "Type" },
                    Operator =      { icon = "+", hl = "Identifier" },
                    TypeParameter = { icon = "𝙏", hl = "Identifier" },
                    Component =     { icon = "󰅴", hl = "Function" },
                    Fragment =      { icon = "󰅴", hl = "Constant" },
                    TypeAlias =     { icon = " ", hl = "Type" },
                    Parameter =     { icon = " ", hl = "Identifier" },
                    StaticMethod =  { icon = " ", hl = "Function" },
                    Macro =         { icon = " ", hl = "Function" },
                },
            },
        })
    end)
end)
