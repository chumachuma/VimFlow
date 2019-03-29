let mapleader = ","
"/	\frac{$0}{$1}
"beg \begin{$0} \end{$0}

function! Inputs(number)
	let output = []
	call inputsave()
	let c = 0
	while c < a:number
		let c += 1
		let in = input('')
		call add(output, in)
	endwhile
	call inputrestore()
	return output
endfunction

function! TexFrac(numerator, denominator)
	return "\\frac{" . a:numerator . "}{" . a:denominator . "}"
endfunction

function! ITexFrac()
	let inputs = Inputs(2)
	return TexFrac(inputs[0], inputs[1])
endfunction

function! TexEnvironment(environment)
	return "\\begin{" . a:environment . "}\n\\end{" . a:environment . "}"
endfunction

function! ITexEnvironment()
	let inputs = Inputs(1)
	return TexEnvironment(inputs[0])
endfunction

inoremap <expr> <leader>/ ITexFrac()
inoremap <expr> <leader>beg ITexEnvironment()
