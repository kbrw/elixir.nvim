function! ref#elixir#define()
  call DocexGetBody("Toto")
  return {'name': 'elixir', 'get_body': function('DocexGetBody')}
endfunction
call ref#register_detection('elixir', 'elixir')
