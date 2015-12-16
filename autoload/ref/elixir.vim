"" doc syntax: markdown where all code blocks are elixir
function! s:opened(query)
  syn include @mdelixir syntax/elixir.vim
  unlet! b:current_syntax
  runtime! syntax/markdown.vim
  syn clear markdownCode
  syn clear markdownCodeBlock
  syn region markdownCode matchgroup=markdownCodeDelimiter start="`" end="`" contains=@mdelixir
  syn region markdownCode matchgroup=markdownCodeDelimiter start="^\s*```.*$" end="^\s*```\ze\s*$" contains=@mdelixir
  syn match markdownCodeBlock /^\s*\n\(\(\s\{4,}[^ ]\|\t\+[^\t]\).*\n\)\+/ contains=@mdelixir
endfunction

function! ref#elixir#define()
  call DocexGetBody("Toto")
  return {'name': 'elixir', 'get_body': function('DocexGetBody'), 'opened': function('s:opened')}
endfunction
call ref#register_detection('elixir', 'elixir')
