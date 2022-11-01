":help index + quickref
" user UI define
let mapleader=" "
let $head_c="~/Desktop/src/Head_C.h"
let $env_c="~/Desktop/src/c_lang_learning/"
let $LANG='en'
set langmenu=en
set nocompatible
"set mouse=a
set autochdir
set smartindent
syntax on
set number
set ruler
set expandtab
set tabstop=4
set shiftwidth=4
set wrap
set showcmd
set showmode
set wildmenu
set wildmode=list:longest,full
set hlsearch
exec "nohlsearch"
exec "set vb t_vb= "
set incsearch
set smartcase
set backspace=3
set noswapfile
set encoding=utf-8
set updatetime=100
set fileencodings=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set cursorline
"set completeopt+=prview,menu
"set list
"set listchars=trail:◌
set autochdir
set laststatus=2
"set statusline=%f%<%=%y%m%r%h%w%{&ff}\[%{&fenc}]#%n\(%03l/%3L,%2c)%3p%%
set scrolloff=4
"set relativenumber
set hidden
"set foldmethod=indent
set clipboard=unnamed
set complete-=k complete+=k
set guifont=Consolas:h14

autocmd FileType cpp,c set dictionary=~/.vim/dict/c_cpp_dict.txt
autocmd FileType python set dictionary=~/.vim/dict/python_dict.txt
autocmd FileType plaintex set dictionary=~/.vim/dict/tex_dict.txt

autocmd FileType cpp set makeprg=g++\ %\ -o\ ./%<
autocmd FileType c set makeprg=gcc\ %\ -o\ ./%<
let loaded_matchparen=1
set completeopt=menu,menuone,noselect
set splitright
set splitbelow
set mousehide
let g:netrw_banner = 0
let g:netrw_liststyle =3
let g:netrw_altv = 1
let g:netrw_browse_split = 3
let g:netrw_winsize = 20
let g:netrw_list_hide = '^\..*'

" load the user abbr 
source ~/.vim/abbr/abbreviation.vim

"colorscheme koehler
"colorscheme ron
filetype plugin indent on
filetype on

" user define function
inoremap  <tab> <c-r>=Smart_TabComplete()<CR>
autocmd FileType c,cpp  nnoremap <silent> $ :call SetTitle()<CR>
autocmd FileType c,cpp nnoremap <silent> /  :call Add_Comment()<CR>
autocmd FileType c,cpp vnoremap <silent> / :call Add_Comment()<CR>
nnoremap <silent> ss  :call ChangeToBracket()<CR>
nnoremap <silent> s[  :call ChangeToSquareBracket()<CR>
nnoremap <silent> s" :call ChangeToDoubleQuote()<CR>
nnoremap <silent> s' :call ChangeToSingleQuote()<CR>
nnoremap <silent> s :call Delete_bracket()<CR>
nnoremap <silent> <Leader>q :call ToggleList()<CR>

nnoremap <Leader>a :call SequenceNumber()<CR>
function! SequenceNumber()
    let @q = "yyp"
    let @a = "ylkphx"
endfunction


" 1 -> blinking block  闪烁的方块
" 2 -> solid block  不闪烁的方块
" 3 -> blinking underscore  闪烁的下划线
" 4 -> solid underscore  不闪烁的下划线
" 5 -> blinking vertical bar  闪烁的竖线
" 6 -> solid vertical bar  不闪烁的竖线

""" user key map 

"nnoremap <BS> a<BS><Esc>
"inoremap <A-o> <C-X><C-O>
"nnoremap <Space> i<Space><Esc>
inoremap l <Right>
inoremap h <Left>
inoremap k <Down>
inoremap j <Up>
inoremap ; <nop>
inoremap w <nop>
inoremap q <nop>
inoremap e <nop>
inoremap s <nop>
inoremap jj <ESC>
""inoremap ( ()<Left>
""inoremap { {}<Left>
""inoremap [ []<Left>
""inoremap ' ''<Left>
inoremap d <C-w>
inoremap r <C-r>
inoremap u &
inoremap i *
inoremap o +
inoremap <buffer> <silent> p ^
inoremap ( <nop>
inoremap 9 <nop>
inoremap 1 5
inoremap 2 6
inoremap 3 7
inoremap 4 8
autocmd FileType c,cpp inoremap \\ \n
autocmd FileType c,cpp inoremap kk ->
autocmd FileType c,cpp inoremap jk ()<left>
autocmd FileType c,cpp inoremap kl {}<left>
autocmd FileType plaintex inoremap $ $$<left>

"inoremap jk \| <++> \|
"|<SPACE><++><SPACE>|<SPACE><++><SPACE>|<SPACE><++><SPACE>|<CR>|------|------|------|<CR>|<SPACE><++><SPACE>|<SPACE><++><SPACE>|<SPACE><++><SPACE>|

autocmd Filetype plaintex inoremap <buffer> <silent> ff <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype plaintex nnoremap <buffer> <silent> ff <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype plaintex inoremap <buffer> <silent> 1 \
autocmd Filetype plaintex inoremap <buffer> <silent> jk {}<left>
autocmd Filetype plaintex inoremap <buffer> <silent> kk ()<left>


nnoremap s <nop>
nnoremap k gj
nnoremap j gk
nnoremap K 5j
nnoremap J 5k
nnoremap <LEADER><CR> :nohlsearch<CR>
nnoremap H ^
nnoremap L $
nnoremap w <C-w>w
nnoremap l :bn<CR>
nnoremap h :bp<CR>
nnoremap P o<Esc>p
"nnoremap [p "+p
"nnoremap Y "+y
"nnoremap ++ :%y"+<CR>
nnoremap -= :w \| source ~/.vim/vimrc<CR>
nnoremap sv <C-w>H
nnoremap sh <C-w>K
nnoremap , o<Esc>k
nnoremap ; :
nnoremap e %
nnoremap tt :tabnew<CR>:edit 
"nnoremap tn :tabnex<CR>
nnoremap o <C-o>
nnoremap i <C-i>
nnoremap n *
nnoremap <silent> <Tab> :tabnext<CR>
nnoremap Q :q!<CR>
"nnoremap <Leader><Leader> :wq<CR>
nnoremap W :w<CR>
nnoremap E :tabnew ~/.vim/vimrc<CR>
autocmd FileType c,cpp nnoremap R :tabnew ~/c_cpp_dict.txt<CR>
autocmd FileType plaintex nnoremap R :tabnew ~/tex_dict.txt<CR>
nnoremap b <C-^>
nnoremap a A;<Esc>
nnoremap <LEADER>r zR
nnoremap <LEADER>m zM
nnoremap  ! :AsyncRun! -mode=term -pos=floaterm ./build/%<<CR>
nnoremap < <<
nnoremap > >>
nnoremap b B
nnoremap w W
nnoremap % :%y<CR>
nnoremap U <C-r>
nnoremap ]] ]m
nnoremap [[ [m
nnoremap ` <C-^>
nnoremap 1 :vert sbn<CR>
nnoremap <Leader>1 :ls<CR>
nnoremap q :call CompileRunGcc()<CR>
nnoremap = =i{
nnoremap f zfi{
nnoremap <C-j> 3<C-y>
nnoremap <C-k> 3<C-e>
nnoremap to :tabonly<CR>
"autocmd BufRead * normal zR
"autocmd FileType c,cpp nnoremap <CR> zA
autocmd FileType c,cpp nnoremap y zA
autocmd QuickFixCmdPre * normal w
"autocmd CompleteChanged *.cpp,*.c normal <C-n>

"autocmd FileType c,cpp inoremap ;; .
autocmd BufWinLeave *.cpp,*.c silent mkview
autocmd BufWinEnter *.cpp,*.c silent loadview


onoremap j i(
onoremap [ i[
onoremap k i{
onoremap < i<
onoremap W iw
onoremap L $
onoremap H ^
onoremap " i"
onoremap ' i'
onoremap ; t;
onoremap ) t)
onoremap , t,
onoremap <space> t<space>
onoremap } t}


vnoremap k j
vnoremap j k
vnoremap J 5k
vnoremap K 5j


map <left> :vertical res -5<CR>
map <right> :vertical res +5<CR>
map <up> :res +5<CR>
map <down> :res -5<CR>

tnoremap jj <C-\><C-n>
cnoremap jj <C-e><C-u><esc>

call plug#begin('$VIM/plugged')

Plug 'bling/vim-airline'
"let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
" 关闭tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '
let g:airline#extensions#tabline#tab_nr_type = 0 " # of splits (default)
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_min_count = 3
let g:airline#extensions#tabline#ignore_bufadd_pat = '!'
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
let g:airline#extensions#tabline#buffers_label = '❯'
let g:airline#extensions#tabline#exclude_preview = 0
let g:airline#extensions#tabline#buf_label_first = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"unicode symbols
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

Plug 'joshdick/onedark.vim'
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

Plug 'mhinz/vim-startify'
Plug 'yggdroot/indentLine'

Plug 'preservim/nerdtree'
map <silent> # :NERDTreeToggle \| wincmd p<CR>
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
""当NERDTree为剩下的唯一窗口时自动关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=0
let NERDTreeWinSize=22
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeAutoCenter=1
let g:NERDTreeDirArrowExpandable = '❯'
let g:NERDTreeDirArrowCollapsible = '═'
" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

Plug 'ryanoasis/vim-devicons'

Plug 'preservim/tagbar'
let g:tagbar_width=25
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
nnoremap <Leader>t :TagbarToggle<CR>
let g:tagbar_sort = 0

Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['brown',       'firebrick3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open=8
nnoremap j :cnext<CR>
nnoremap k :cprevious<CR>
nnoremap m :make<CR>
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

Plug 'skywind3000/vim-auto-popmenu'
let g:apc_enable_ft = {'*':1}
let g:apc_enable_tab = 0
set cpt=.,w,k,b
set shortmess+=c

"Plug 'dense-analysis/ale'
" 对c++、c、python单独设置linter
"let g:ale_linters = { 'c++': ['gcc'],
"\   'c': ['gcc'],
"\   'python': ['pylint'],
"\}
"let g:ale_sign_column_always = 1
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚡'
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0
"let g:ale_lint_on_enter = 0
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
" 开/关语法检查
"nmap <Leader>s :ALEToggle<CR>
" 查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
" Use release branch (recommend)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'davidhalter/jedi-vim'
Plug 'neomake/neomake'
Plug 'voldikss/vim-floaterm'
nnoremap <silent> f :FloatermNew --wintype=float<CR>
nnoremap <silent> g :FloatermToggle<CR>
nnoremap <silent> K :FloatermKill<CR>
tnoremap <silent> k <C-\><C-n>:FloatermKill<CR>
let g:floaterm_width = 0.7
let g:floaterm_height = 0.7

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_OPTS = '--info=inline -e --bind ctrl-k:down,ctrl-j:up --preview "bat --style=numbers --color=always --line-range :500 {}" --layout=reverse'
nnoremap <Leader>g :FloatermNew Fzf<CR>
nnoremap <Leader>g :FloatermNew ag
"let g:fzf_preview_window = ['right,50%', 'ctrl-/']

Plug 'easymotion/vim-easymotion'
nmap <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
nmap  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to line
nmap <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
nmap  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map / <Plug>(incsearch-fuzzy-/)
map ? <Plug>(incsearch-fuzzy-?)
" map g/ <Plug>(incsearch-fuzzy-stay)
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> g/ incsearch#go(<SID>config_easyfuzzymotion())

call plug#end()


colorscheme onedark
call neomake#configure#automake('w')
