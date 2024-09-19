
-- Bufferline Highlight
-- Custom highlights for BufferLine
vim.cmd [[
  hi BufferLineIndicatorSelected guibg=#3c3836 guifg=#d65d0e gui=bold
  hi BufferLineFill guibg=#282828
  hi BufferLineBackground guibg=#282828
  hi BufferLineBufferSelected guibg=#1d2021 guifg=#ebdbb2
  hi BufferLineBuffer guibg=#282828 guifg=#a89984
  hi BufferLineCloseButton guibg=#282828 guifg=#fb4934
  hi BufferLineCloseButtonVisible guibg=#282828 guifg=#fb4934
  hi BufferLineCloseButtonSelected guibg=#282828 guifg=#fb4934
  hi BufferLineTab guibg=#282828
  hi BufferLineTabSelected guibg=#1d2021
  hi BufferLineTabClose guibg=#282828
  hi BufferLineModified guifg=#fe8019
]]
















-- Setting Imports
print("Loading bootstrap")
require("config.bootstrap")
print("Loading options")
require("config.options")
print("Setting up lazy")
require("lazy").setup(require("config.plugins"))
print("Configuration loaded")



