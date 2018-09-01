" easycolors
"
" Maintainer: Santiago Herrera Cardona <santiagohecar@gmail.com>

if version > 580

	hi clear

	if exists('syntax_on') | syntax reset | endif

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

  let fgcolor = s:Color(get(a:hi, 'fg', ''))
  let bgcolor = s:Color(get(a:hi, 'bg', ''))
  let opt     = get(a:hi, 'opt', 'none')

  let command  = " hi ".a:group
  let command .= " guifg   = ".fgcolor["hex"]."  guibg   = ".bgcolor["hex"]."  gui   = ".opt
  let command .= " ctermfg = ".fgcolor["term"]." ctermbg = ".bgcolor["term"]." cterm = ".opt

  execute command

endfunction


function! s:Color(color_name)

  let color = get(g:easycolor['palette'], a:color_name, {"term": "NONE", "hex": "NONE"})

  if !exists('color.term') | let color.term = "NONE" | endif
  if !exists('color.hex')  | let color.hex  = "NONE" | endif

  return color

endfunction


function! s:HiTerm()

  if !exists("g:easycolor.terminal") | return | endif

  for number in keys(g:easycolor.terminal)

    let color = s:Color(g:easycolor.terminal[number])['hex']

    execute "let g:terminal_color_".number." = '".color."'"

  endfor

endfunction


function! s:HiIdentLine()

  if !exists("g:easycolor.identline") | return | endif

  let g:indentLine_color_term = s:Color(g:easycolor.identline)['term']
  let g:indentLine_color_gui  = s:Color(g:easycolor.identline)['hex']

endfunction


function! s:HiFzf()

  if !exists("g:easycolor.fzf") | return | endif

  let g:fzf_colors = g:easycolor.fzf

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

  call s:HiTerm()
  call s:HiIdentLine()
  call s:HiFzf()

endfunction


call s:Init()
