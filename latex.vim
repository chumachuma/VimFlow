let mapleader = ","
"/	\frac{$0}{$1}
"beg	\begin{$0} \end{$0}
"tab	\begin{tabular}{$0} \end{tabular}
"lr	\left{$0} \right{$1}
"i	\item[$0]
"i0	\item[]
"m	$$	
"meq	$\displaystyle $	
"eq	\[\]
"mm	\begin{align} \end{align}
"\\ \nonumber\\
"C-k \textit{}
"C-b \bm{}
"w
"b
"e
"$
"^

function! Inp(number, function)
	let inputs = []
	call inputsave()
	let c = 0
	while c < a:number
		let in = input(c . ': ')
		call add(inputs, in)
		let c += 1
	endwhil
	call inputrestore()
	exec "return " . a:function . "(inputs)"
endfunction

function! TexFrac(inputs)
	return "\\frac{" . a:inputs[0] . "}{" . a:inputs[1] . "}"
endfunction

function! TexEnvironment(inputs)
	return "\\begin{" . a:inputs[0] . "}\n\\end{" . a:inputs[0] . "}"
endfunction

function! TexTabular(inputs)
	return "\\begin{tabular}{" . a:inputs[0] . "}\n\\end{tabular}"
endfunction

function! TexLeftRight(inputs)
	return "\\left" . a:inputs[0] . "  \\right" . a:inputs[1]
endfunction

function! TexItem(inputs)
	return "\\item[" . a:inputs[0] . "]"
endfunction

inoremap <expr> <leader>/ Inp(2, "TexFrac")
inoremap <expr> <leader>beg Inp(1, "TexEnvironment") . "\<ESC>O"
inoremap <expr> <leader>tab Inp(1, "TexTabular") . "\<ESC>O"
inoremap <expr> <leader>lr Inp(2, "TexLeftRight") . "\<ESC>7hi"
inoremap <expr> <leader>i Inp(1, "TexItem")
inoremap <leader>i0 \item[] 
inoremap <leader>m $$<ESC>i
inoremap <leader>meq $\displaystyle $<ESC>i
inoremap <leader>eq \[\]<ESC>hi
inoremap <expr> <leader>mm TexEnvironment(["align"]) . "\<ESC>O"
inoremap <leader>\\ \nonumber\\<CR>
inoremap <leader><C-k> \textit{}<ESC>i
inoremap <leader><C-b> \bm{}<ESC>i
inoremap <leader>w <ESC>wi
inoremap <leader>b <ESC>bi
inoremap <leader>e <ESC>ea
inoremap <leader>$ <ESC>$a
inoremap <leader>^ <ESC>^i

set conceallevel=2
highlight clear Conceal

setlocal spell
set spelllang=en_gb
syntax spell toplevel
