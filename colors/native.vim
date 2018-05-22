" Vim color file
"
" Name: native
" Maintainer: Santiago Herrera Cardona <santiagohecar@gmail.com>

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif


set background=light
set t_Co=256
let g:colors_name = "native"

let s:path                = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let s:hi_definitions_path = s:path."/colors/native.json"
let s:hi_definitions      = json_decode(join(readfile(s:hi_definitions_path), "\n")) 

let g:native_palette = s:hi_definitions


" ==============================================================================
" HIGHTLIGHT 

function! s:Hi(group, hi)

  if exists("a:hi.link")
    execute "hi link ".a:group." ".a:hi.link
    return
  endif
  
  let fgcolor = get(s:hi_definitions["palette"], get(a:hi, 'fg', ''), {"term":"NONE", "hex":"NONE"})
  let bgcolor = get(s:hi_definitions["palette"], get(a:hi, 'bg', ''), {"term":"NONE", "hex":"NONE"})
  let opt     = get(a:hi, 'opt', 'none')
  
  let command  = " hi ".a:group
  let command .= " guifg   = ".fgcolor["hex"]."  guibg   = ".bgcolor["hex"]."  gui   = ".opt
  let command .= " ctermfg = ".fgcolor["term"]." ctermbg = ".bgcolor["term"]." cterm = ".opt

  execute command
endfunction


function! s:Init()

  let hi_types = s:hi_definitions["hi"]

  for hi_type in keys(hi_types)

    let hi_groups = hi_types[hi_type] 

    for group_name in keys(hi_groups)

      let hi = hi_groups[group_name]

      call s:Hi(group_name, hi)
    endfor
  endfor
endfunction


call s:Init()
