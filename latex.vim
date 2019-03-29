let mapleader = ","
"/	\frac{$0}{$1}
"beg	\begin{$0} \end{$0}
"m	$$	
"eq	\[\]
"mm	\begin{align} \end{align}

function! Inp(number, function)
	let inputs = []
	call inputsave()
	let c = 0
	while c < a:number
		let in = input(c . ': ')
		call add(inputs, in)
		let c += 1
	endwhile
	call inputrestore()
	exec "return " . a:function . "(inputs)"
endfunction

function! TexFrac(inputs)
	return "\\frac{" . a:inputs[0] . "}{" . a:inputs[1] . "}"
endfunction

function! TexEnvironment(inputs)
	return "\\begin{" . a:inputs[0] . "}\n\\end{" . a:inputs[0] . "}"
endfunction

inoremap <expr> <leader>/ Inp(2, "TexFrac")
inoremap <expr> <leader>beg Inp(1, "TexEnvironment") . "\<ESC>O"
inoremap <leader>m $$<ESC>i
inoremap <leader>eq \[\]<ESC>hi
inoremap <expr> <leader>mm TexEnvironment(["align"]) . "\<ESC>O"
inoremap <leader>\\ \nonumber\\<CR>
