## Custom Neovim Configuration by Dwk0910
This repository contains my personal Neovim configuration files.<br/>
It is tailored to my workflow and preferences, but you are welcome to use it as a starting point for your own setup.

### Screenshots
![Screenshot 1](https://i.postimg.cc/3Rq3HJdW/screenshot-1.png)
![Screenshot 2](https://i.postimg.cc/SRzkQFMd/screenshot-2.png)

### Installation
1. **Backup Existing Configuration**: If you have an existing Neovim configuration, back it up to avoid losing your settings.
```bash
mv ~/.config/nvim ~/.config/nvim_backup
```

2. **Clone the Repository**: Clone this repository to your local machine.
```bash
git clone https://github.com/Dwk0910/neovim.git ~/.config/nvim
```

3. **Remove Git History**: If you want to start fresh without the commit history, remove the `.git` directory.
```bash
rm -rf ~/.config/nvim/.git
```
### Run
4. **Open Neovim**: Launch Neovim to automatically install the plugins and set up the configuration.
```bash
nvim
```
### Features
- **Plugin Management**: Uses `lazy.nvim` for efficient plugin management and lazy loading.
- **LSP Support**: Integrated with `nvim-lspconfig` for language server support.
- **Autocompletion**: Configured with `nvim-cmp` for intelligent code completion.
- **Syntax Highlighting**: Enhanced syntax highlighting with `nvim-treesitter`.
- **File Explorer**: Includes `nvim-tree.lua` for a file explorer sidebar.
- **Status Line**: Custom status line with `lualine.nvim`.
- **Fuzzy Finder**: Integrated `telescope.nvim` for powerful file searching and navigation.
- **TUI based git client**: `lazygit.nvim` for managing git repositories within Neovim.
- **Color Scheme**: Uses `everforest` for a visually appealing color scheme.
- **Markdown Preview**: Uses 'markdown-preview.nvim' for live markdown preview. So you can run `:MarkdownPreview` to preview markdown files in your browser. 
- **Auto Pairs**: Automatically closes brackets, quotes, etc. with `nvim-autopairs`.
- **Copilot AI**: Integrated GitHub Copilot for AI-assisted code completion.
- **Floating Terminal**: Easily toggle a floating terminal within Neovim. (Default terminal: `Powershell 7`)

### Customized key mappings
- `Tab`: Go to next Tab
- `Tab (In Insert Mode)`: Accept suggestion from Copilot
- `Shift + Tab`: Go to previous Tab
- `Shift + f`: Close current tab
- `Ctrl + f`: Open live grep search
- `Ctrl + s`: Save current file
- `Ctrl + q`: Save all files and quit
- `Space + e`: Toggle file Explorer
- `Space + gg`: Open lazygit
- `Space + gd`: Go to definition
- `Space + ccc`: Open color pallete
- `Space + ff`: Open file finder
- `Down Arrow`: Go to next item in suggestion list
- `Up Arrow`: Go to previous item in suggestion list
- `Shift + k`: Go to previous error/warning line
- `Shift + j`: Go to next error/warning Line
- `Shift + e`: Show hover action
- `Shift + c`: Open terminal in floating window

### Requirements
- Neovim 0.8 or higher
- Git
- GitHub CLI
- Node.js v20 or higher
- Nerdfont v3

### Credits
All configurations and plugins are credited to their respective authors.<br/>
Special thanks to the Neovim community for their contributions and support.

***Thanks for reading!***<br/>
This configuration is open-sourced under the MIT License.<br/>
Feel free to modify and adapt it to your needs!

