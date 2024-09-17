-- File: lua/config/bootstrap.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local command = { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
    local out = vim.fn.system(command)
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_err_writeln("Failed to clone lazy.nvim. Error: " .. out)
        return
    end
    print("Lazy.nvim installed successfully!")
end
vim.opt.rtp:prepend(lazypath)