return {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
        require('competitest').setup({
            runner_ui = {
                interface = "split"
            },
            testcases_directory = "tests",
        })
    end,
}
