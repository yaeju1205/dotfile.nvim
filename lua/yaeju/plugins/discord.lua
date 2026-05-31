vim.plugin.namespace("yaeju-discord", function()
    vim.plugin.install("vyfor/cord.nvim")(function()
        require("cord").setup({
            ipc = {
                socket = "discord-ipc-1",
            },
            display = {
                theme = "classic"
            }
        })
    end)
end)
