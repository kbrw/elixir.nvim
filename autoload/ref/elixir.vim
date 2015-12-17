"" doc syntax: markdown where all code blocks are elixir, handle erlang man
function! s:opened(query)
  if getline(1)[0] == "#"
    syn clear
    syn include @mdelixir syntax/elixir.vim
    unlet! b:current_syntax
    runtime! syntax/markdown.vim
    syn clear markdownCode
    syn clear markdownCodeBlock
    syn match markdownCode /`[^`]*`/ contains=@mdelixir
    syn region markdownCode matchgroup=markdownCodeDelimiter start="^\s*```.*$" end="^\s*```\ze\s*$" contains=@mdelixir
    syn match markdownCodeBlock /^\s*\n\(\(\s\{4,}[^ ]\|\t\+[^\t]\).*\n\)\+/ contains=@mdelixir
  else
    syn clear
    runtime! syntax/man.vim
  endif
endfunction

function! ref#elixir#define()
  call DocexGetBody("Toto")
  return {'name': 'elixir', 'get_body': function('DocexGetBody'), 'opened': function('s:opened')}
endfunction
call ref#register_detection('elixir', 'elixir')
