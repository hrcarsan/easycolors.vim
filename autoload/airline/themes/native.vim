" Vim color file
"
" Name: native
" Maintainer: Santiago Herrera Cardona <santiagohecar@gmail.com>

let s:hi_def    = g:native_palette["airline"]
let s:palette   = {}
let s:modes     = ['normal', 'insert', 'replace', 'visual', 'inactive']
let s:overrides = ['modified', 'paste']


function! s:Hi(mode)

  let s:palette[a:mode] = a:mode == "normal"? {}: copy(s:palette.normal)

  if !exists("s:hi_def.".a:mode) | return |  endif

  let sections = s:hi_def[a:mode]

  for section in keys(sections)

    let hi      = sections[section]
    let section = "airline_".section
    let fgcolor = get(g:native_palette["palette"], get(hi, 'fg', ''), {"term":"", "hex":""})
    let bgcolor = get(g:native_palette["palette"], get(hi, 'bg', ''), {"term":"", "hex":""})
    let opt     = get(hi, 'opt', '')

    let s:palette[a:mode][section] =
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

let g:airline#themes#native#palette = s:palette
