"F3 is used in OSX
autocmd BufNewFile *.cc call ICC()
func ICC()
	call setline(1, "#include <cstdio>")
	call setline(2, "#include <cstring>")
	call setline(3, "#include <iostream>")
	call setline(4, "#include <algorithm>")
	call setline(5, "")
	call setline(6, "using namespace std;")
	call setline(7, "")
	call setline(8, "int main()")
	call setline(9, "{")
	call setline(10, "	return 0;")
	call setline(11, "}")
endfunc

autocmd BufNewFile *.go call IGO()
func IGO()
	call setline(1, "package main")
	call setline(2, "")
	call setline(3, "import (")
	call setline(4, "	\"fmt\"")
	call setline(5, ")")
	call setline(6, "")
	call setline(7, "func main() {")
	call setline(8, "}")
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
	elseif &filetype == 'rust'
		exec "!cargo run"
	elseif &filetype == 'go'
		exec "!go run %"
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
	elseif &filetype == 'rust'
		exec "!cargo build"
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
	elseif &filetype == 'rust'
		exec "!cargo run"
	elseif &filetype == 'go'
		exec "!go run %"
	endif
endfunc

nmap 0 ^

"set autoindent
"set cindent
"set tabstop=4
"set shiftwidth=4

set nu
set ruler
set cursorline

syntax on
colorscheme molokai

autocmd FileType c set ai cin ts=4 sw=4
autocmd FileType cpp set ai cin ts=4 sw=4
autocmd FileType yaml set ai ts=2 sw=2 et
autocmd FileType python set ai ts=2 sw=2 et
autocmd FileType sh set ai ts=4 sw=4
autocmd FileType go set ai ts=4 sw=4
autocmd FileType rust set ai cin ts=4 sw=4 et
autocmd FileType dockerfile set ai cin ts=4 sw=4
