vim.plugin.namespace("yaeju-discord", function()
    vim.plugin.install("vyfor/cord.nvim")(function()
        require("cord").setup({
            display = {
                theme = "classic"
            },

            editor = {
                client = "vim",
                tooltip ="i love vscode and zed",
                icon = "https://cdn.picrew.me/shareImg/org/202606/2806659_EyV1GWtY.png"
            },

            text = {
                default = "nyang??",
                workspace = "nyaang..",
                editing = function(opts)
                    return string.format("nyang nyang in %s", opts.filename)
                end,
                file_browser = function(opts)
                    return string.format("nyangggg in %s", opts.tooltip)
                end
            },

            assets = {
                [".rs"] = {
                    icon = "rust",
                    tooltip = "i like this language",
                    text = "override - teto"
                },
                [".hs"] = {
                    icon = "haskell",
                    tooltip = "i like this language",
                    text = "override - teto"
                },
            }
        })
    end)
end)
