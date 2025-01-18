local config = {
    cmd = {'/home/ricky/.local/share/nvim/mason/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'pom.xml', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
