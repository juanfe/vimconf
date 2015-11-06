" Configuration of Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

"" My Bundle here:
""
"" Para instalar los Bundle ejecute :BundleInstall
" Para que funcione powerline inslate vim-python o vim-pyhton-jedi
Bundle 'Lokaltog/vim-powerline'
" Para usar pyflakes también se necesita vim-python o vim-python-jedi
" Y posiblemente python-astroid
Bundle 'kevinw/pyflakes-vim'
" fugitive es un plugin para commandos de git, use g<git command>
Bundle 'tpope/vim-fugitive'
" NerdTree es un plugin para ver archivos como un arbol, use F2 y ? para ver
" cómo funciona, adicione el map <F2> :NERDTreeToggle<CR>
Bundle 'scrooloose/nerdtree'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
"" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"" non github repos
"Bundle 'git://git.wincent.com/command-t.git'


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

augroup vimrc_autocmds
    autocmd!
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
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

set backspace=indent,eol,start

"Command history
set history=50

" Powerline setup
" To install the font, download from : https://github.com/powerline/fonts
" And copy to ~/.fonts
" git clone https://github.com/powerline/fonts.git
" Muy segurament este font se installa con dejavu con vim-pyhton-jedi
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\9
set laststatus=2

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

":nmap <F2> : :NERDTreeToggle<CR>
:map :nt : :NERDTreeToggle<CR>
:nmap :ni : :setlocal noautoindent <CR> :setlocal nocindent <CR> :setlocal nosmartindent <CR> :setlocal indentexpr=
