iabb forj for(int i = 0; i < n; i++){}<esc>V:s/ i//g<left><left>
iabb fork for(int i = 0; i > 0; i--){}<esc>V:s/ i//g<left><left>

"iabb beg \begin{<++>}<CR>\end{<++>}<ESC>1j2hd4l
"iabb beg \section{<++>}<CR>\end{<++>}<ESC>1j2hd4l
"iabb newth \newtheorem{thm}{<++>}<ESC>4hd4l
"iabb deg $^\circ$
"iabb sup ^{}<ESC>
"iabb sub _{}<ESC>
"iabb fig \begin{figure}<CR><Tab>\centering<CR>\includegraphics[scale=<++>]{<++>}<CR>\caption<CR>\label{<++>}<CR>\end{figure}ESC><J
"iabb tab \begin{table}<CR>\begin{tabular}{\|rrr\|}<CR>\hline<CR><++>&<++>&<++>\\ <CR>\end{tabular}<CR>\end{table}<ESC>2jH

iabb frac \frac{<++>}{<++>} 
iabb lim \lim_{<++> \to <++>}
iabb lim0 \lim_{<++> \to 0}
iabb brace \lbrace<++>\rbrace
iabb partial \frac{\partial <++>}{\partial <++>}
iabb derive0 \left.\frac{{\rm d}\<++>}{{\rm d}x}\right\|{x=0}
iabb derive \left.\frac{{\rm d}\<++>}{{\rm d}x}\right\|{x=<++>}
iabb integer0 \int_{0}^{<++>} {<++>} {\rm d}x
iabb integer \int_{<++>}^{<++>} {<++>} {\rm d}x
iabb align \begin{aligned}<CR><CR>\end{aligned}<ESC>j
iabb array \begin{array}<CR><CR>\end{array}<ESC>j

