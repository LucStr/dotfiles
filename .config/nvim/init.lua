-- Vanilla Config
require('LucStr.settings')
require('LucStr.autocmd')
require('LucStr.plugins')
require('LucStr.keybinds')

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
