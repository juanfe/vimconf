syn region djangotagmarkers start="{{" end="}}"
syn region djangovariablemarkers start="{%" end="%}"
command! -nargs=+ HiLink hi def link <args>
HiLink djangotagmarkers PerProc
HiLink djangovariablemarkers PreProc
delcomand HiLink
