"" doc syntax: markdown where all code blocks are elixir, handle erlang man
function! s:opened(query)
  let l:erlheader = split(getline(1),'/')
  if l:erlheader[0] != 'erlfun' && l:erlheader[0] != 'erlmod'
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
    if l:erlheader[0] == 'erlfun'
      normal d2f/
      call search('^\s*'.l:erlheader[1].'(.*')
    else
      normal df/
    endif
  endif
endfunction

function! ref#elixir#define()
  call DocexGetBody("Toto")
  return {'name': 'elixir', 'get_body': function('DocexGetBody'), 'opened': function('s:opened')}
endfunction
call ref#register_detection('elixir', 'elixir')
