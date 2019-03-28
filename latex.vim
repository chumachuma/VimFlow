let mapleader = ","
"/	\frac{$1}{$2}

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

inoremap <expr> <leader>/ ITexFrac()
