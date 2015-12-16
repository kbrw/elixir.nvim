# elixir.nvim

NVim plugin for Elixir.

Thanks to the neovim host plugin: https://github.com/awetzel/neovim-elixir,
you can develop your own vim plugin in Elixir !

The https://github.com/awetzel/nvim-rplugin project is a vim plugin in Elixir,
containing vim functions and commands for documentation, elixir evaluation and completion.

This Vim plugin packages both to give you a nice development environment for Elixir in nvim.

![screencast](screencast.gif)

# Features

- Omni completion with doc
- Elixir documentation of modules and functions with colors with `vim-ref` (and `K` binding)
- Interpret the currently selected Elixir Code with `:ElixirExec`
- If no line selected, then the whole file is interpreted, useful to dynamically reload current file modules when the app runs with `:MixStart`
- Bindings are kept along interpretations
- You can reset binding using the bang: `:ElixirExec!`
- Load nearest mix project in current file path with `:MixLoad`
- Start the current mix project application inside your vim: `:MixStart`

# Installation

Just copy this repository into your vim config directory and run `install.sh`
to install both Elixir host for neovim and the elixir plugin.
Two dependencies are needed: the official vim-elixir and vim-ref.

```vim
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': './install.sh' }
```
