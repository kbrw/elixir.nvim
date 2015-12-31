setlocal omnifunc=ElixirComplete
if get(g:,'elixir_autobuild',0)
  au InsertLeave,TextChanged *.ex,*.exs ElixirQuickBuild
endif
