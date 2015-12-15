#!/bin/sh
cd ${0%/*}
mkdir -p rplugin/elixir

git clone https://github.com/awetzel/neovim-elixir
(cd neovim-elixir && mix deps.get && MIX_ENV=host mix escript.build && cp -R vim-elixir-host/tools/nvim_elixir_host ../tools/)
rm -Rf neovim-elixir

git clone https://github.com/awetzel/nvim-rplugin
(cd nvim-rplugin && mix deps.get && mix archive.build && cp nvim_rplugin-*.ez ../rplugin/elixir/)
rm -Rf nvim-rplugin
