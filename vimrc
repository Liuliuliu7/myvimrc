":help index + quickref
" user UI define
let mapleader=" "
let $LANG='en'
set langmenu=en
set nocompatible
set mouse=a
set autochdir
set ignorecase
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
set autochdir
set laststatus=2
set scrolloff=4
set hidden
set foldmethod=indent
set foldlevelstart=99
set clipboard=unnamed
set complete-=k complete+=k
set path+=~/.vim/
set pythonthreedll=~/AppData/Local/Programs/Python/Python311/python311.dll
set termguicolors
set whichwrap+=<,>,h,l
set timeoutlen=300
set ttimeoutlen=0
set nobackup
set nowritebackup
set shortmess+=c
set signcolumn=number
set undofile
set undodir=~/.vim/undo
set autoread
set autowrite
set fileformat=dos
autocmd FileType cpp set makeprg=g++\ %\ -o\ ./build/%<
autocmd FileType c set makeprg=gcc\ %\ -o\ ./build/%<
let loaded_matchparen=1
" set completeopt=menuone,noinsert,noselect

set splitright
set splitbelow
set mousehide
let g:netrw_banner = 0
let g:netrw_liststyle =3
let g:netrw_altv = 1
let g:netrw_browse_split = 3
let g:netrw_winsize = 20
let g:netrw_list_hide = '^\..*'

filetype plugin indent on

" user define function
autocmd FileType c,cpp  nnoremap <silent> $ :call SetTitle()<CR>
autocmd FileType c,cpp,python,vim nnoremap <silent> /  :call Add_Comment()<CR>
autocmd FileType c,cpp,python,vim vnoremap <silent> / :call Add_Comment()<CR>
nnoremap <silent> s :call Delete_bracket()<CR>

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
inoremap ; (<esc>ea)<esc>
autocmd FileType c,cpp inoremap \\ \n
autocmd FileType c,cpp inoremap kk ->
autocmd FileType c,cpp inoremap jk ()<left>
autocmd FileType c,cpp inoremap kl {}<left>
autocmd FileType plaintex inoremap $ $$<left>

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
nnoremap H g^
nnoremap L g$
nnoremap w <C-w>w
nnoremap P o<Esc>p
"nnoremap [p "+p
nnoremap -= :w \| source ~/.vim/vimrc<CR>
" nnoremap sv <C-w>H
" nnoremap sh <C-w>K
nnoremap , o<Esc>k
nnoremap ; :
nnoremap e %
nnoremap tt :tabnew<CR>:edit
nnoremap <Leader>t :vertical terminal ++cols=50<CR>
nnoremap l <C-i>
nnoremap h <C-o>
nnoremap n *
nnoremap <silent> <Tab> :tabnext<CR>
nnoremap Q :q!<CR>
nnoremap W :w<CR>
nnoremap E :tabnew ~/.vim/vimrc<CR>
nnoremap a A;<Esc>
nnoremap <LEADER>r zR
nnoremap <LEADER>m zM
autocmd FileType c,cpp  nnoremap  !  :vertical terminal ++cols=45 ./build/%<<CR>
autocmd FileType python nnoremap  !  :terminal python %<CR>

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
nnoremap q :call CompileRunGcc()<CR>
nnoremap <C-j> 3<C-y>
nnoremap <C-k> 3<C-e>
nnoremap to :tabonly<CR>
nnoremap <Leader>, /
nnoremap <Leader>// /\c
nnoremap <Leader>/w /\c\<\><left><left>
nnoremap <Leader>d :g/^\s*$/d<CR>
" nnoremap <silent> <CR> za
nnoremap <silent> A zA
nnoremap F ;
nnoremap T ,
nnoremap t :tab split<CR>
" nnoremap <C-g> g;
nnoremap <c-g> `.
nnoremap <CR> zA

autocmd FileType c,cpp nnoremap <silent> <buffer> <CR> zA

autocmd BufWinLeave *.cpp,*.c silent mkview
autocmd BufWinEnter *.cpp,*.c silent loadview

nnoremap ( i(
onoremap j i(
onoremap ) t)
onoremap [ i[
onoremap ] t]
onoremap [ i[
onoremap k i{
onoremap } t}
onoremap < i<
onoremap W iw
onoremap L $
onoremap H ^
onoremap " i"
onoremap ' i'
onoremap ; t;
onoremap , f,
onoremap <space> f<space>

xnoremap k j
xnoremap j k
xnoremap J 5k
xnoremap K 5j
xnoremap ss :s///g<left><left><left>
xnoremap sw :s/\<\>//g<left><left><left><left><left>
xnoremap <Leader>d :g/^\s*$/d<CR>
xnoremap <Leader>; :normal


nnoremap <left> 5<c-w><
nnoremap <right> 5<c-w>>
nnoremap <up> 5<c-w>+
nnoremap <down> 5<c-w>-

tnoremap jj <C-\><C-n>
cnoremap jj <C-e><C-u><esc>
cnoremap h <left>
cnoremap l <right>
cnoremap j <C-p>
cnoremap k <C-n>
cnoremap xx \<\><left><left>

call plug#begin('$VIM/plugged')

Plug 'bling/vim-airline'
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
if (has("autocmd") && !has("gui_running"))
    augroup colorset
        autocmd!
        let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
    augroup END
endif
let g:onedark_termcolors=256

Plug 'mhinz/vim-startify'
Plug 'yggdroot/indentLine'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=241
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=240

Plug 'preservim/nerdtree'
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=0
let NERDTreeWinSize=22
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeAutoCenter=1
let g:NERDTreeDirArrowExpandable = '❯'
let g:NERDTreeDirArrowCollapsible = '═'
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == ''|silent NERDTreeMirror|endif

Plug 'ryanoasis/vim-devicons'
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

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)zz
map N  <Plug>(incsearch-nohl-N)zz
map *  <Plug>(incsearch-nohl-*)zz
map #  <Plug>(incsearch-nohl-#)zz
map / <Plug>(incsearch-fuzzy-/)
map ? <Plug>(incsearch-fuzzy-?)
function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzy#converter()],
                \   'modules': [incsearch#config#easymotion#module()],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" let g:snipMate = { 'snippet_version' : 1 }
" imap <C-k> <Plug>snipMateNextOrTrigger
" smap <C-k> <Plug>snipMateNextOrTrigger
" imap <C-j> <Plug>snipMateBack
" smap <C-j> <Plug>snipMateBack
" sunmap n
" sunmap N


Plug 'tpope/vim-surround'
" let g:surround_no_mappings = 1
nmap s" :call SurroundDoubleQuote()<CR>
nmap s[ :call SurroundSquareBracket()<CR>
nmap s' :call SurroundQuote()<CR>
nmap s( :call SurroundBracket()<CR>
xmap s <Plug>VSurround

Plug 'MattesGroeger/vim-bookmarks'
Plug 'matze/vim-move'
let g:move_map_keys=0
vmap k <Plug>MoveBlockDown
vmap j <Plug>MoveBlockUp
vmap l <Plug>MoveBlockRight
vmap h <Plug>MoveBlockLeft

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-pyright', 'coc-json', 'coc-vimlsp', 'coc-clangd']
inoremap <silent><expr> k
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Down>" :
            \ coc#refresh()
inoremap <expr>j coc#pum#visible() ? coc#pum#prev(1) : "\<Up>"
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm()
            \: "\<Tab>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> [[ <Plug>(coc-diagnostic-prev)
nmap <silent> ]] <Plug>(coc-diagnostic-next)
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')
set pumheight=8

autocmd! FileType c,cpp Plug 'aperezdc/vim-template'
let g:templates_no_builtin_templates = 1
let g:templates_directory = '~/.vim/templates'
let g:templates_user_variables = [['FileName', 'GFileName'],]

function GFileName()
    return toupper(expand('%:t:r'))
endfunction

call plug#end()
colorscheme onedark
" call neomake#configure#automake('w')
map <silent> # :NERDTreeToggle \| wincmd p<CR>
