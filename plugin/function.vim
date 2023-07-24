function! Add_Comment()
    let l:li = line(".")
    let l:pco = col(".")
    normal L
    let substr = strcharpart(getline("."), -1, col(".")+1)

    if &filetype == 'cpp' || &filetype == 'c'
        let l:comment_size = 3
        let l:co = match(substr, "//") + 1
        let l:position = [0, li, co, 0]
        if co
            call setpos(".", position)
            normal 3x
            let l:position[2] = pco - comment_size
            call setpos(".", position)
        else
            normal I// 
            let l:position[2] = pco + comment_size
            call setpos(".", position)
        endif
    elseif &filetype == 'python' || &filetype == 'vim'
        let l:comment_size = 2
        if &filetype == 'python'
            let l:co = match(substr, "#") + 1
        elseif &filetype == 'vim'
            let l:co = match(substr, "\"") + 1
        endif
        let l:position = [0, li, co, 0]
        if co
            call setpos(".", position)
            normal 2x
            let l:position[2] = pco - comment_size
            call setpos(".", position)
        else
            if &filetype == 'python'
                normal I# 
            elseif  &filetype == 'vim'
                normal I" 
            endif
            let l:position[2] = pco + comment_size
            call setpos(".", position)
        endif
    endif

endfunction
 
function! SurroundDoubleQuote()
    let l:cur_char = getline(".")[col(".")-1]
    if(cur_char == '(')
        normal cs("
    elseif(cur_char == '[')
        normal cs["
    elseif(cur_char == "'")
        normal cs'"
    else 
        normal ysiw"
    endif
endfunction

function! SurroundSquareBracket()
    let l:cur_char = getline(".")[col(".")-1]
    if(cur_char == '(')
        normal cs(]
    elseif(cur_char == '"')
        normal cs"]
    elseif(cur_char == "'")
        normal cs']
    else 
        normal ysiw]
    endif
endfunction

function! SurroundQuote()
    let l:cur_char = getline(".")[col(".")-1]
    if(cur_char == '(')
        normal cs('
    elseif(cur_char == '"')
        normal cs"'
    elseif(cur_char == "[")
        normal cs['
    else 
        normal ysiw'
    endif
endfunction

function! SurroundBracket()
    let l:cur_char = getline(".")[col(".")-1]
    if(cur_char == '[')
        normal cs[)
    elseif(cur_char == '"')
        normal cs")
    elseif(cur_char == "'")
        normal cs')
    else 
        normal ysiw)
    endif
endfunction

function! Delete_bracket()
    let l:cur_char = getline(".")[col(".")-1]
    if cur_char !='(' && cur_char != '[' && cur_char != '{' && cur_char != ')' && cur_char != ']'&& cur_char != '}'
        return
    endif
    let l:li = line(".")
    let l:co = col(".")
    let l:position = [0, li, co, 0]
    normal! %x
    call setpos(".", position)
    normal! x
endfunction

" cursor change
if &term =~ "xterm"
    " INSERT mode
    let &t_SI = "\<Esc>[5 q"
    " . .  "\<Esc>]12;gray\x7"
    " REPLACE mode
    let &t_SR = "\<Esc>[3 q"
    ". "\<Esc>]12;darkgray\x7"
    " NORMAL mode
    let &t_EI = "\<Esc>[2 q"
    "" . "\<Esc>]12;darkgray\x7"
endif

func! CompileRunGcc()
    silent exec "w"
    silent exec "!clear"
    if &filetype == 'c'
        if !isdirectory('build')
            exec "!mkdir build && gcc -Wall -O2 % -o build/%<"
        else
            exec "!gcc -Wall -O2 % -o build/%<"
        endif

    elseif &filetype == 'cpp'
        if !isdirectory('build')
            exec "!mkdir build && g++ -Wall -O2 % -o build/%< -lpthread"
        else
            exec "!g++ -Wall -O2 % -o build/%< -lpthread"
        endif
    endif
endfunc
