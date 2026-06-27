vim.plugin.namespace("yaeju-discord", function()
    vim.plugin.install("vyfor/cord.nvim")(function()
        require("cord").setup({
            ipc = {
                socket = "discord-ipc-1",
            },
            display = {
                theme = "classic"
            },

            editor = {
                editor = "vscode",
                tooltip ="i love vscode and zed",
                icon = "https://cdn.picrew.me/shareImg/org/202606/2806659_EyV1GWtY.png"
            },
        })
    end)
end)
