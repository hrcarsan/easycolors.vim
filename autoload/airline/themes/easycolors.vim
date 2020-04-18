" Airline easycolors
"
" Maintainer: Santiago Herrera Cardona <santiagohecar@gmail.com>

let s:easycolor = g:easycolor["airline"]
let s:palette   = {}
let s:modes     = ['normal', 'insert', 'replace', 'visual', 'inactive', 'tabline']
let s:overrides = ['modified', 'paste']

let g:airline#themes#easycolors#palette = s:palette

"let g:airline#themes#easycolors#palette.tabline = {
   "\    'airline_tabfill':       ['#f8f8f8','#780000',231,88,''],
   "\    'airline_tabmod_unsel': ['#dddddd','#463030',231,52,''],
   "\ }

function! s:Hi(mode)

  let s:palette[a:mode] = a:mode == "normal"? {}: copy(s:palette.normal)

  if !exists("s:easycolor.".a:mode) | return |  endif

  let sections = s:easycolor[a:mode]

  for section in keys(sections)

    let hi      = sections[section]
    let fgcolor = get(g:easycolor["palette"], get(hi, 'fg', ''), {"term":"", "hex":""})
    let bgcolor = get(g:easycolor["palette"], get(hi, 'bg', ''), {"term":"", "hex":""})
    let opt     = get(hi, 'opt', '')

    let s:palette[a:mode]["airline_".section] =
    \[
      \fgcolor['hex'],  bgcolor['hex'],
      \fgcolor['term'], bgcolor['term'],
      \opt
    \]

  endfor
endfunction


for mode in s:modes

  call s:Hi(mode)

  "for override in s:overrides

    "call s:Hi(mode.'_'.override)
  "endfor
endfor

