local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N')

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- Quit neovim
map('n', '<C-Q>', '<CMD>qa!<CR>')

-- Move to last buffer
map('n', "''", '<CMD>b#<CR>')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-\\>', '<CMD>vsplit<CR>')
map('n', '<A-\\>', '<CMD>split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')

-- Window Navigation
map({'n', 'i', 't'}, '<A-h>', '<CMD>NavigatorLeft<CR>')
map({'n', 'i', 't'}, '<A-j>', '<CMD>NavigatorDown<CR>')
map({'n', 'i', 't'}, '<A-k>', '<CMD>NavigatorUp<CR>')
map({'n', 'i', 't'}, '<A-l>', '<CMD>NavigatorRight<CR>')
map({'n', 'i', 't'}, '<A-p>', '<CMD>NavigatorPrevious<CR>')

-- Search through all files
map('n', '<leader>f', '<CMD>Telescope live_grep<CR>')

-- Open Project explorer
map('n', '<leader>p', '<CMD>Telescope projects<CR>')

-- Open oldfiles
map('n', '<leader>o', '<CMD>Telescope oldfiles<CR>')

-- Open Explorer
map('n', '<leader>e', '<CMD>NvimTreeToggle<CR>')

-- Terminal
map({'n', 't'}, '<A-i>', '<CMD>ToggleTerm<CR>')
