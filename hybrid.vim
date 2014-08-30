" Hybrid Airline Theme
" Maintainer:   João Campinhos
" Version:      1.0

let g:airline#themes#hybrid#palette = {}

function! airline#themes#hybrid#refresh()

    let s:N1 = airline#themes#get_highlight('DiffChange')
    let s:N2 = airline#themes#get_highlight2(['Text', 'fg'], ['Pmenu', 'bg'])
    let s:N3 = airline#themes#get_highlight2(['Text', 'fg'], ['Folded', 'bg'])
    let g:airline#themes#hybrid#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

    let modified_group = airline#themes#get_highlight2(['Text', 'fg'], ['SpellRare', 'bg'])
    let g:airline#themes#hybrid#palette.normal_modified = {
                \ 'airline_c': airline#themes#get_highlight2(['DiffRemove', 'fjaksdhdhfbg'], ['Folded', 'bg'])
                \ }

    let warning_group = airline#themes#get_highlight('DiffRemove')
    let g:airline#themes#hybrid#palette.normal.airline_warning = warning_group
    let g:airline#themes#hybrid#palette.normal_modified.airline_warning = warning_group

    let s:I1 = airline#themes#get_highlight('DiffAdd')
    let g:airline#themes#hybrid#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)
    let g:airline#themes#hybrid#palette.insert_modified = g:airline#themes#hybrid#palette.normal_modified
    let g:airline#themes#hybrid#palette.insert.airline_warning = g:airline#themes#hybrid#palette.normal.airline_warning
    let g:airline#themes#hybrid#palette.insert_modified.airline_warning = g:airline#themes#hybrid#palette.normal_modified.airline_warning

    let s:R1 = airline#themes#get_highlight('DiffText')
    let g:airline#themes#hybrid#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:N3)
    let g:airline#themes#hybrid#palette.replace_modified = g:airline#themes#hybrid#palette.normal_modified
    let g:airline#themes#hybrid#palette.replace.airline_warning = g:airline#themes#hybrid#palette.normal.airline_warning
    let g:airline#themes#hybrid#palette.replace_modified.airline_warning = g:airline#themes#hybrid#palette.replace_modified.airline_warning

    let s:V1 = airline#themes#get_highlight2(['VertSplit', 'fg'],['DiffRemove', 'bg'])
    let g:airline#themes#hybrid#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:N3)
    let g:airline#themes#hybrid#palette.visual_modified = g:airline#themes#hybrid#palette.normal_modified
    let g:airline#themes#hybrid#palette.visual.airline_warning = g:airline#themes#hybrid#palette.normal.airline_warning
    let g:airline#themes#hybrid#palette.visual_modified.airline_warning = g:airline#themes#hybrid#palette.normal_modified.airline_warning

    let s:IA = airline#themes#get_highlight('StatusLineNC')
    let g:airline#themes#hybrid#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
    let g:airline#themes#hybrid#palette.inactive_modified = {
                \ 'airline_c': [ modified_group[0], '', modified_group[2], '', '' ]
                \ }

    let g:airline#themes#hybrid#palette.accents = {
                \ 'red': airline#themes#get_highlight('Constant'),
                \ }

endfunction

call airline#themes#hybrid#refresh()
