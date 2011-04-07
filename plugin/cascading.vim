
" php
" $var->foo->bar->short( )->very_long_long_long( )->very_long_long_long_long( )
"
" perl
" $var->config()->very_long()->goTo(10);

let g:cascading_char = {
      \ "php": [ '\(\w\|)\)\@<=->\(\w\{5,}\)\@=' ,  "\->" ],
      \ "ruby": [ '\(\w\|)\)\@<=\.\(\w\{5,}\)\@=' , "." ],
      \ "perl": [ '\(\w\|)\)\@<=->\(\w\{5,}\)\@=' , "\->" ]
      \ }

" blahsdjfieji->
fun! s:cascading(a1,a2)
  let mode = "start"
  let ft = &filetype
  let ft = 'php'

  if ! has_key( g:cascading_char , ft )
    return
  endif

  let args = g:cascading_char[ ft ]

  let ptn = args[0]
  let replace = args[1]
  for i in range(a:a1,a:a2)
    let line = getline(i)
    let sw     = &shiftwidth
    let indent = repeat( ' ' ,  indent(i) + sw )
    let line = substitute( line , ptn , "\n" . indent . replace , 'g' )

    let lines = split( line , "\n" )
    if len(lines) > 0
      cal setline( i , remove(lines, 0 ) )
      cal append( i , lines )
    endif
  endfor
endf

com! -range Cascading :cal s:cascading(<line1>,<line2>)
nmap -- :Cascading<CR>

