" Vim color file
"
" Name: native
" Maintainer: Santiago Herrera Cardona <santiagohecar@gmail.com>

function! s:Color(fg, bg, ...)
  let opt     = get(a:, 1, 'NONE')
  let palette = g:native_palette["palette"] 

  return [ palette[a:fg]['hex'],  palette[a:bg]['hex'], 
          \palette[a:fg]['term'], palette[a:bg]['term'], opt]
endfunction

let s:palette = {}

let s:palette.normal           = {}
let s:palette.normal.airline_a = s:Color('Blonde',     'Umber')
let s:palette.normal.airline_b = s:Color('EerieBlack', 'Blonde')
let s:palette.normal.airline_c = s:Color('Blonde',     'Umber')
let s:palette.normal.airline_x = s:Color('Blonde',     'Umber')
let s:palette.normal.airline_y = s:Color('Black',      'Blonde')
let s:palette.normal.airline_z = s:Color('EerieBlack', 'Blonde')

let s:palette.insert  = copy(s:palette.normal)

let s:palette.replace = copy(s:palette.normal)

let s:palette.inactive           = {}
let s:palette.inactive.airline_a = s:Color('Blonde', 'Umber')
let s:palette.inactive.airline_b = s:Color('Blonde', 'Umber')
let s:palette.inactive.airline_c = s:Color('Blonde', 'Umber')
let s:palette.inactive.airline_x = s:Color('Blonde', 'Umber')
let s:palette.inactive.airline_y = s:Color('Blonde', 'Umber')
let s:palette.inactive.airline_z = s:Color('Blonde', 'Umber')

let g:airline#themes#native#palette = s:palette
