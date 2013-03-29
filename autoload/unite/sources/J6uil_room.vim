
function! unite#sources#J6uil_room#define()
  return s:source
endfunction

let s:source = {
      \ 'name': 'J6uil/room',
      \ 'action_table'   : {},
      \ 'default_action' : {'common' : 'execute'},
      \ 'is_listed'      : 0,
      \ }

function! s:source.gather_candidates(args, context)
  return map(J6uil#get_rooms() , '{
             \ "word" : v:val,
             \ }')
endfunction

let s:source.action_table.execute = {'description' : 'change room'}
function! s:source.action_table.execute.func(candidate)
  let room = a:candidate.word
  echo room
  call J6uil#subscribe(room)
endfunction
