" Activamos el resaltado de sintaxis
 syntax on
"
" " Activamos la barra de informacion
 set ruler
"
" " Desactivamos la compatibilidad con VI
 set nocompatible
"
" " El identado lo hace VIM
 set autoindent

" opciones de tabulacion. 4 espacios
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set incsearch
 set expandtab

 "comportamiento de backspace
 set backspace=indent,eol,start

"Numeros de linea
"set nu

"tema de colores
colorscheme desert

"Identacion
filetype indent on

"tipo de fichero
filetype on

"plugin
filetype plugin on

filetype plugin indent on

"python debugger
"autocmd FileType python compiler pylint

"autocomlete to Javascript
autocmd FileType javascript set omnifunc=javascript#CompleteJS

"autocomlete to css
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"autocomlete to php
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"autocomlete to html
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"autocomlete to python
autocmd FileType python set omnifunc=pythoncomplete#Complete

set backspace=indent,eol,start

"Command history
set history=50


" This code autocloses parenthesis, brackets, etc around cursor
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(’)')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair(’}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(’]')<CR>
"function ClosePair(char)
"    if getline(’.')[col('.') - 1] == a:char
"        return “<Right>”
"    else
"        return a:char
"    endif
"endf
"This map adds lines to the previous trick…
"inoremap { {<CR><BS>}<ESC>ko

let g:surround_{char2nr("b")} = "{% block\1 \r..*\r &\1%}\r{% endblock %}"
let g:surround_{char2nr("i")} = "{% if\1 \r..*\r &\1%}\r{% endif %}"
let g:surround_{char2nr("w")} = "{% with\1 \r..*\r &\1%}\r{% endwith %}"
let g:surround_{char2nr("c")} = "{% comment\1 \r..*\r &\1%}\r{% endcomment %}"
let g:surround_{char2nr("f")} = "{% for\1 \r..*\r &\1%}\r{% endfor %}"
