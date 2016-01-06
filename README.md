# elixir.nvim with real contextual completion and doc

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
- Deoplete source file for async completion (https://github.com/Shougo/deoplete.nvim)
- The command `:ElixirQuickBuild` parses the current buffer to
  maintain a map of line-> `__ENV__`, after a call, the completion and documentation 
  will be aware of the context (aliases, imports, use).
- The `:ElixirQuickBuild` background compilation can trigger error
  highlighting and log into vim to help your debugging.

# Installation

Just copy this repository into your vim config directory and run `install.sh`
to install both Elixir host for neovim and the elixir plugin.

After installation, run `:UpdateRemotePlugins` inside your neovim, then restart
it to add then Elixir functions and commands to vim.

This package has two dependencies but **optional**: the official vim-elixir for
syntax and indent and vim-ref for doc.

```vim
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': './install.sh' }
```

# Configuration

Two possible configurations are available for the completion function:

- `g:elixir_maxmenu` is an integer giving the max length of the function doc
  preview in omni completion, default to 70
- `g:elixir_docpreview` is a boolean (int 0 or 1) to choose if you
  want the completion function to open doc in preview window or not,
  default to 0.
- `g:elixir_showerror` is a boolean (int 0 or 1) to choose if you
  want to highlight the errorneous line and log the error into vim
  during `:ElixirQuickBuild` compilation. Default to 0.
- `g:elixir_autobuild` is a boolean (int 0 or 1) to choose if you
  want to automatically launch the environment compilation (`:ElixirQuickBuild`)
  when you leave insert mode or when you save your file. Default to 0.
