" Vim color file
"
" Name: native
" Maintainer: Santiago Herrera Cardona <santiagohecar@gmail.com>

set background=light

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "native"

function! s:DoHi(group, hi)

  if exists("a:hi.link")
    execute "hi link ".a:group." ".a:hi.link
    return
  endif
  
  let none    = {"term":"NONE", "hex":"NONE"}
  let fgcolor = get(s:pallete, get(a:hi, 'fg', ''), none)
  let bgcolor = get(s:pallete, get(a:hi, 'bg', ''), none)
  let opt     = get(a:hi, 'opt', 'none')
  
  let command  = "hi ".a:group
  let command .= " guifg   = ".fgcolor["hex"]."  guibg   = ".bgcolor["hex"]."  gui   = ".opt
  let command .= " ctermfg = ".fgcolor["term"]." ctermbg = ".bgcolor["term"]." cterm = ".opt

  execute command
endfunction

function! s:Hi(hi)
  for h in keys(a:hi)
    call s:DoHi(h, a:hi[h])
  endfor
endfunction

" ==============================================================================
" PALLETE DEFINITION
let s:path      = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let s:json_file = s:path."/colors/native.json"
let s:json      = json_decode(join(readfile(s:json_file), "\n")) 

let s:pallete = s:json["pallete"] 

let g:native_pallete = s:pallete

" ==============================================================================
" HIGHTLIGHT 

for hi in keys(s:json["hi"])
  call s:Hi(s:json["hi"][hi])
endfor
