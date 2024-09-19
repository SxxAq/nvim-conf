-- Setting Imports
print("Loading bootstrap")
require("config.bootstrap")
print("Loading options")
require("config.options")
print("Setting up lazy")
require("lazy").setup(require("config.plugins"))
print("Configuration loaded")



