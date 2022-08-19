require('project_nvim').setup({
    exclude_dirs = {
        '~/.config/*',
    },
})

require('telescope').load_extension('projects')

