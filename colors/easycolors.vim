" easycolors
"
" Maintainer: Santiago Herrera Cardona <santiagohecar@gmail.com>

if version > 580

	hi clear

	if exists("syntax_on") | syntax reset | endif
endif


set background=light

if !exists("g:easycolor_path")

  let s:path           = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
  let g:easycolor_path = s:path."/colors/native.json"
endif

let g:easycolor = json_decode(join(readfile(g:easycolor_path), "\n"))


function! s:Hi(group, hi)

  if exists("a:hi.link")
    execute "hi link ".a:group." ".a:hi.link
    return
  endif

  let fgcolor = get(g:easycolor["palette"], get(a:hi, 'fg', ''), {"term": "NONE", "hex": "NONE"})
  let bgcolor = get(g:easycolor["palette"], get(a:hi, 'bg', ''), {"term": "NONE", "hex": "NONE"})
  let opt     = get(a:hi, 'opt', 'none')

  let command  = " hi ".a:group
  let command .= " guifg   = ".fgcolor["hex"]."  guibg   = ".bgcolor["hex"]."  gui   = ".opt
  let command .= " ctermfg = ".fgcolor["term"]." ctermbg = ".bgcolor["term"]." cterm = ".opt

  execute command
endfunction


function! s:Init()

  let hi_types = g:easycolor["hi"]

  for hi_type in keys(hi_types)

    let hi_groups = hi_types[hi_type]

    for group_name in keys(hi_groups)

      let hi = hi_groups[group_name]

      call s:Hi(group_name, hi)
    endfor
  endfor
endfunction


call s:Init()
