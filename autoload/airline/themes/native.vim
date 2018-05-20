" Vim color file
"
" Name: native
" Maintainer: Santiago Herrera Cardona <santiagohecar@gmail.com>

let s:pallete = g:native_pallete

function! s:Color(fg, bg, ...)
  let opt = get(a:, 1, 'NONE')
  return [ s:pallete[a:fg]['hex'], s:pallete[a:bg]['hex'], s:pallete[a:fg]['term'], s:pallete[a:bg]['term'], opt]
endfunction

let g:airline#themes#native#palette                  = {}

let g:airline#themes#native#palette.normal           = {}
let g:airline#themes#native#palette.normal.airline_a = s:Color('Blonde',     'Umber')
let g:airline#themes#native#palette.normal.airline_b = s:Color('EerieBlack', 'Blonde')
let g:airline#themes#native#palette.normal.airline_c = s:Color('Blonde',     'Umber')
let g:airline#themes#native#palette.normal.airline_x = s:Color('Blonde',     'Umber')
let g:airline#themes#native#palette.normal.airline_y = s:Color('Black',      'Blonde')
let g:airline#themes#native#palette.normal.airline_z = s:Color('EerieBlack', 'Blonde')

let g:airline#themes#native#palette.insert  = copy(g:airline#themes#native#palette.normal)

let g:airline#themes#native#palette.replace = copy(g:airline#themes#native#palette.normal)

let g:airline#themes#native#palette.inactive           = {}
let g:airline#themes#native#palette.inactive.airline_a = s:Color('Blonde', 'Umber')
let g:airline#themes#native#palette.inactive.airline_b = s:Color('Blonde', 'Umber')
let g:airline#themes#native#palette.inactive.airline_c = s:Color('Blonde', 'Umber')
let g:airline#themes#native#palette.inactive.airline_x = s:Color('Blonde', 'Umber')
let g:airline#themes#native#palette.inactive.airline_y = s:Color('Blonde', 'Umber')
let g:airline#themes#native#palette.inactive.airline_z = s:Color('Blonde', 'Umber')

