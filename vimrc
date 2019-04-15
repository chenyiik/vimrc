"F3 is used in OSX
nmap <F3> :call O()<CR>
func O()
	exec "w"
	exec "!open % &"
endfunc

nmap <F5> :call A()<CR>
func A()
	exec "wa"
	if &filetype == 'c'
		exec "!mkdir cmake 2>/dev/null; gcc % -o cmake/%< -Wall -O2 && cmake/%<"
	elseif &filetype == 'cpp'
		exec "!mkdir cmake 2>/dev/null; g++ % -o cmake/%< -Wall -O2 -std=c++17 && cmake/%<"
	elseif &filetype == 'java'
		exec "!javac % && java %<"
	elseif &filetype == 'python'
		exec "!python3 %"
	endif
endfunc

nmap <F6> :call C()<CR>
func C()
	exec "wa"
	if &filetype == 'c'
		exec "!mkdir cmake 2>/dev/null; gcc % -o cmake/%< -Wall -O2"
	elseif &filetype == 'cpp'
		exec "!mkdir cmake 2>/dev/null; g++ % -o cmake/%< -Wall -std=c++17 -O2"
	elseif &filetype == 'java'
		exec "!javac %"
	endif
endfunc

nmap <F7> :call R()<CR>
func R()
	if &filetype == 'c' || &filetype == 'cpp'
		exec "!cmake/%<"
	elseif &filetype == 'java'
		exec "!java %<"
	elseif &filetype == 'python'
		exec "!python3 %"
	endif
endfunc

set autoindent
set cindent
set tabstop=4
set shiftwidth=4

set nu
set ruler
set cursorline

syntax on
colorscheme molokai

