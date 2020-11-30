"F3 is used in OSX
autocmd BufNewFile *.cc call ICC()
func ICC()
	let x = 0
	call setline(x + 1, "#include <cstdio>")
	call setline(x + 2, "#include <cstring>")
	call setline(x + 3, "#include <iostream>")
	call setline(x + 4, "#include <algorithm>")
	call setline(x + 5, "")
	call setline(x + 6, "using namespace std;")
	call setline(x + 7, "")
	call setline(x + 8, "int main()")
	call setline(x + 9, "{")
	call setline(x + 10, "	return 0;")
	call setline(x + 11, "}")
endfunc

autocmd BufNewFile *.url call IURL()
func IURL()
	call setline(1, "[InternetShortcut]")
	call setline(2, "URL=")
endfunc

nmap <F3> :call O()<CR>
func O()
	exec "w"
	exec "!open -e % &"
endfunc

nmap <F5> :call A()<CR>
func A()
	exec "wa"
	if &filetype == 'c'
		exec "!mkdir -p .cmake; gcc % -o .cmake/%< -Wall -O2 && .cmake/%<"
	elseif &filetype == 'cpp'
		exec "!mkdir -p .cmake; g++ % -o .cmake/%< -Wall -O2 -std=c++17 && .cmake/%<"
	elseif &filetype == 'java'
		exec "!javac % && java %<"
	elseif &filetype == 'python'
		exec "!python3 %"
	elseif &filetype == 'sh'
		exec "!./%"
	endif
endfunc

nmap <F6> :call C()<CR>
func C()
	exec "wa"
	if &filetype == 'c'
		exec "!mkdir -p .cmake; gcc % -o .cmake/%< -Wall -O2"
	elseif &filetype == 'cpp'
		exec "!mkdir -p .cmake; g++ % -o .cmake/%< -Wall -std=c++17 -O2"
	elseif &filetype == 'java'
		exec "!javac %"
	endif
endfunc

nmap <F7> :call R()<CR>
func R()
	if &filetype == 'c' || &filetype == 'cpp'
		exec "!.cmake/%<"
	elseif &filetype == 'java'
		exec "!java %<"
	elseif &filetype == 'python'
		exec "!python3 %"
	elseif &filetype == 'sh'
		exec "!./%"
	endif
endfunc

nmap 0 ^

set autoindent
set cindent
set tabstop=4
set shiftwidth=4

set nu
set ruler
set cursorline

syntax on
colorscheme molokai

