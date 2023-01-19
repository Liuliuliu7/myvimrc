function! Smart_TabComplete()
    let l:line = getline('.')                         " current line
    let l:substr = strpart(line, -1, col('.'))      " from the start of the current
    " line to one character right
    " of the cursor
    let l:substr = matchstr(substr, "[^ \t]*$")       " word till cursor
    if (strlen(substr) == 0)                          " nothing to match on empty string
        return "\<tab>"
    endif
    let l:has_period = match(substr, '\.') != -1      " position of period, if any
    let l:has_slash = match(substr, '\/') != -1       " position of slash, if any
    if (has_slash && !exists("g:files_popup"))
        let g:files_popup = 1
        return "\<C-x>\<C-f>"                         " file matching
    else
        return "\<C-N>"                         " existing text matching
        unlet g:files_popup
    endif
endfunction

" function! SkipPair()
    " if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
        " return "\<ESC>la"
    " else
        " return "\t"
    " endif
" endfunc
" " 将tab键绑定为跳出括号
" inoremap <TAB> <c-r>=SkipPair()<CR>

function! Add_Comment()
    let l:li = line(".")
    let l:pco = col(".")
    normal L
    let substr = strcharpart(getline("."), -1, col(".")+1)
    let l:co = match(substr, "//") + 1
    let l:position = [0, li, co, 0]
    if co
        call setpos(".", position)
        normal 3x
        let l:position[2] = pco - 3
        call setpos(".", position)
    elseif &filetype == 'cpp' || &filetype == 'c'
        normal I// 
        let l:position[2] = pco + 3
        call setpos(".", position)
    endif
endfunction
" 
" function! Add_Bracket()
    " let l:pre_col = col(".")
    " let l:pre_position = [0, line("."), col(".")+1, 0]
    " normal! i(
    " normal! $
    " let l:substr = strcharpart(getline("."), pre_col, col("."))
    " let l:match_col = match(substr, "[ ;,)]")
    " let l:position = [0, line("."), match_col+pre_col+1, 0]
    " if(match_col == -1)
        " normal! a)
    " else
        " call setpos(".", position)
        " normal! i)
    " endif
    " call setpos(".", pre_position)
" endfunction
 
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

" function! ChangeToBracket()
    " let l:cur_char = getline(".")[col(".")-1]
    " if (cur_char == '[' || cur_char == '<')
        " let l:line = line(".")
        " let l:co = col(".")
        " let l:position = [0, line, co, 0]
        " normal! %r)
        " call setpos(".", position)
        " normal! r(
    " else
        " call Add_Bracket()
    " endif
" endfunction
" 
" function! ChangeToSquareBracket()
    " let l:cur_char = getline(".")[col(".")-1]
    " if (cur_char == '(' || cur_char == '<')
        " let l:line = line(".")
        " let l:co = col(".")
        " let l:position = [0, line, co, 0]
        " normal! %r]
        " call setpos(".", position)
        " normal! r[
    " else
        " call Add_SquareBracket()
    " endif
" endfunction
" 
" function! Add_SquareBracket()
    " let l:pre_col = col(".")
    " let l:pre_position = [0, line("."), col(".")+1, 0]
    " normal! i[
    " normal! $
    " let l:substr = strcharpart(getline("."), pre_col, col("."))
    " let l:match_col = match(substr, "[ ;,)]")
    " let l:position = [0, line("."), match_col+pre_col+1, 0]
    " if(match_col == -1)
        " normal! a]
    " else
        " call setpos(".", position)
        " normal! i]
    " endif
    " call setpos(".", pre_position)
" endfunction
" 
" function! Add_DQuote()
    " let l:pre_col = col(".")
    " let l:pre_position = [0, line("."), col(".")+1, 0]
    " normal! i"
    " normal! $
    " let l:substr = strcharpart(getline("."), pre_col, col("."))
    " let l:match_col = match(substr, "[ ;,)]")
    " let l:position = [0, line("."), match_col+pre_col+1, 0]
    " if(match_col == -1)
        " normal! a"
    " else
        " call setpos(".", position)
        " normal! i"
    " endif
    " call setpos(".", pre_position)
" endfunction
" 
" function! ChangeToDoubleQuote()
    " let l:cur_char = getline(".")[col(".")-1]
    " if (cur_char == "'")
        " let l:line = line(".")
        " let l:co = col(".")
        " let l:position = [0, line, co, 0]
        " normal! $
        " if(getline(".")[col(".")-1] == "'")
            " normal! r"
        " else
            " normal! F'r"
        " endif
        " call setpos(".", position)
        " normal! r"
    " else
        " call Add_DQuote()
    " endif
" endfunction
" 
" function! Add_SQuote()
    " let l:pre_col = col(".")
    " let l:pre_position = [0, line("."), col(".")+1, 0]
    " normal! i'
    " normal! $
    " let l:substr = strcharpart(getline("."), pre_col, col("."))
    " let l:match_col = match(substr, "[ ;,)]")
    " let l:position = [0, line("."), match_col+pre_col+1, 0]
    " if(match_col == -1)
        " normal! a'
    " else
        " call setpos(".", position)
        " normal! i'
    " endif
    " call setpos(".", pre_position)
" endfunction
" 
" function! ChangeToSingleQuote()
    " let l:cur_char = getline(".")[col(".")-1]
    " if (cur_char == '"')
        " let l:line = line(".")
        " let l:co = col(".")
        " let l:position = [0, line, co, 0]
        " normal! $
        " if(getline(".")[col(".")-1] == '"')
            " normal! r'
        " else
            " normal! F"r'
        " endif
        " call setpos(".", position)
        " normal! r'
    " else
        " call Add_SQuote()
    " endif
" endfunction


"autocmd InsertLeave * call Auto_Format()

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

" function ToggleList()
    " if exists("g:qfix_win")
        " normal! <C-w>j
        " cclose
        " unlet g:qfix_win
    " else
        " copen 8
        " let g:qfix_win=1
    " endif
" endfunction

" function! FileList()
    " if exists("g:f_list")
        " unlet g:f_list
        " normal h
        " q
    " else
        " Vexplore
        " let g:f_list=1
    " endif
" endfunction

"新建.c,.h,.sh,.java文件，自动插入文件头
""定义函数SetTitle，自动插入文件头
function! SetTitle()
    if &filetype == 'c'
        "call setline(1, "/***")
        "call append(line("."), "    >>> File Name: ".expand("%"))
        "call append(line(".")+1, "    >>> Author: wh")
        "call append(line(".")+2, "    >>> Created Time: ".strftime("%c"))
        "call append(line(".")+3, "***/")
        "call append(line(".")+4, "")
        "call append(line(".")+5, "#include<stdio.h>")
        "call append(line(".")+6, "#include<stdlib.h>")
        "call append(line(".")+7, "#define max(a, b) ((a>b)?a:b)")
        "call append(line(".")+8, "#define min(a, b) ((a<b)?a:b)")
        "call append(line(".")+9, "#define Print(a) (printf(\"%d \" b, a))")
        "call append(line(".")+10, "#define dscanf(n) (scanf(\"%d\", &n))")
        "call append(line(".")+11, "" )
        "call append(line(".")+12, "int main()")
        "call append(line(".")+13, "{" )
        "call append(line(".")+14, "" )
        "call append(line(".")+15, "    return 0;")
        "call append(line(".")+16, "}")
        call setline(1, "#include<reg52.h>")
        call append(line("."), "")
        call append(line(".")+1, "typedef unsigned int u16;")
        call append(line(".")+2, "typedef unsigned char u8;")
        call append(line(".")+3, "")
        call append(line(".")+4, "int main() {")
        call append(line(".")+5, "")
        call append(line(".")+6, "    return 0;")
        call append(line(".")+7, "}")
    elseif &filetype == 'cpp'
        call setline(1, "/***")
        call append(line("."), "    >>> File Name: ".expand("%"))
        call append(line(".")+1,  "    >>> Author: wh")
        call append(line(".")+2, "    >>> Created Time: ".strftime("%c"))
        call append(line(".")+3, "***/")
        call append(line(".")+4, "")
        call append(line(".")+5, "#include <algorithm>")
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "#define Maxn 0x3f3f3f3f")
        call append(line(".")+8, "#define Minn 0xaaaaaaaa")
        call append(line(".")+9, "using namespace std;")
        call append(line(".")+10, "" )
        call append(line(".")+11, "int main() {")
        call append(line(".")+12, "    ios::sync_with_stdio(false);" )
        call append(line(".")+13, "    cin.tie(0);" )
        call append(line(".")+14, "" )
        call append(line(".")+15, "    return 0;")
        call append(line(".")+16, "}")
    endif
    norm G2j
endfunction
"新建文件后，自动定位到文件末尾

" autocmd FileType c,cpp nnoremap gc :call RunGcc()<CR>
" function! RunGcc()
" silent exec "!clear"
" silent exec "w"
" if !isdirectory('build')
" silent execute "!mkdir build"
" endif
" if &filetype == 'cpp'
" exec "!g++ -Wall -O2 % -o build/%<"
" elseif &filetype == 'c'
" exec "!gcc -Wall -O2 % -o build/%<"
" endif
" endfunction

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
"autocmd BufNew *.cpp,*.c :call SetTitle()<CR>
"
" 定义跳出括号函数，用于跳出括号
