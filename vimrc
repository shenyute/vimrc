
" For pathogen.vim: auto load all plugins in .vim/bundle
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
set cin
set noai
set ru
set showcmd
set bs=2
set nobackup
set textwidth=85
set wrap
set wrapmargin=85
set smartcase

" ======================
" Vundle setting
" ======================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'https://github.com/tpope/vim-fugitive'
Bundle 'rhysd/vim-clang-format'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'junegunn/fzf.vim'
"Bundle 'scrooloose/nerdtree'
"Bundle 'kien/ctrlp.vim'
"Bundle 'mileszs/ack.vim'
"Bundle 'majutsushi/tagbar'
"Bundle 'vim-scripts/matchit.zip'
"Bundle 'vim-scripts/wombat256.vim'
"Bundle 'vim-scripts/cscope_macros.vim'

" fzf setting
set rtp+=~/.fzf
" Mapping selecting mappings
" Insert mode completion
imap <c-p><c-p> <plug>(fzf-complete-path)
nmap <c-p> :Files<CR>

" editorconfig need to let fugitive work well
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" gugitive
" :Gblame for blame
" o to open the revision

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" fswitch
au! BufEnter *.cc,*.cpp let b:fswitchdst = 'h' | let b:fswitchlocs = '.'
au! BufEnter *.h let b:fswitchdst = 'cc,cpp' | let b:fswitchlocs = '.'

" screen vim ctrl+pageup, pagedown
:nmap <ESC>[5;5~ <C-PageUp>
:nmap <ESC>[6;5~ <C-PageDown>

"set nowrap

" vim --version need to have +xterm_clipboard
" ubuntu vim-gtk has this
set clipboard=unnamed   " yank to the system register (*) by default
set t_Co=256
set ignorecase
set autoindent		" auto indentation
set hls
hi normal guifg=lightgray guibg=black
colorscheme wombat256mod

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

"pydiction
filetype plugin on
let g:pydiction_location = '/home/command/.vim/after/ftplugin/pydiction/complete-dict'


"NERDTree
"nnoremap <silent> <F5> :NERDTree<CR>
map <F5> :NERDTreeToggle<CR>
"Use the natural vim navigation keys hjkl to navigate the files.
"Press o to open the file in a new buffer or open/close directory.
"Press t to open the file in a new tab.
"Press i to open the file in a new horizontal split.
"Press s to open the file in a new vertical split.
"Press p to go to parent directory.
"Press r to refresh the current directory.
"

"-----------
" highlight cursor line
"-----------

set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=darkblue
"highlight cursorline guibg=blue
"highlight cursorcolumn guibg=blue
"hi CursorLine   cterm=NONE ctermbg=lightgray ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=blue ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>


"-----------
" erlang settings:
"------------
let g:erlangHighlightBif=1
let g:erlangFold=1

"------------
" python settings:
"------------

let python_highlight_all = 1
set expandtab        "replace <TAB> with spaces
set tabstop=2 "4 space tab
set shiftwidth=2 "The amount to block indent when using < and >
set smarttab "Uses shiftwidth instead of tabstop at start of lines
set softtabstop=2 "Causes backspace to delete 4 spaces = converted <TAB>
au FileType Makefile set noexpandtab
"-------------
"for javascript indent
"-------------
au FileType javascript so ~/.vim/indent/javascript.vim
"-------------
"for Workspace Manager
"-------------

let Ws_Inc_Winwidth=0

"------------
"for tab
"------------

map tn :tabnext<CR>
map tp :tabprev<CR>
map te :tabnew 
map tc :tabclose<CR>

nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>
imap <C-h> <Esc>:tabprevious<CR>i
imap <C-l> <Esc>:tabnext<CR>i

"nmap <C-t> :tabnew<CR>
"imap <C-t> <Esc>:tabnew<CR>


"--------------
" highlight customer syntax
"--------------
syntax match OOPS /\OOPS!/
hi OOPS ctermfg=Red
hi OOPS guifg=red

"for trace code
nmap ,, :vnew %<CR>
nmap ,. :tabe %<CR>
"----


"for tagbar
" for C++ tags
nnoremap <silent> <F8> :TagbarToggle<CR>

" use tagbar instead
"for taglist
"----
"nnoremap <F12> : TlistToggle<CR>
"let Tlist_Inc_Winwidth=0


"for paste mode
map <F9> :call Paste_on_off()<CR>i
set pastetoggle=<F9>

let paste_mode = 0

func! Paste_on_off()
    if g:paste_mode == 0
        set paste
        let g:paste_mode = 1
    else
        set nopaste
        let g:paste_mode = 0
    endif
    return
endfunc

if has("autocmd")
    autocmd BufRead,BufNewFile * set kp=man\ -a
    autocmd BufRead,BufNewFile *.py set kp=pydoc
    autocmd BufRead,BufNewFile *.conf,.* set nocin noai
    autocmd BufRead,BufNewFile *.erl set kp=erl\ -man
endif

"set fileencodings=big5,ucs-bom,utf-8,big5,latin1
"set encoding=utf-8
"set fileencoding=ucs-bom,utf-8,default
"set termencoding=big5
set foldmethod=indent "marker

" status bar
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
"set statusline+=%{&fileformat}]%m " file format
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white

"omni completion
filetype plugin on
set ofu=syntaxcomplete#Complete

"ctags
map P :TlistToggle<CR>
map T :TaskList<CR>

" vimgdb settting
"syntax enable			" enable syntax highlighting
nmap <silent><F7> :run macros/gdb_mappings.vim<cr>
"set previewheight=12		" set gdb window initial height
"run macros/gdb_mappings.vim	" source key mappings listed in this document
"set asm=0				" don't show any assembly stuff
"set gdbprg=gdb_invocation		" set GDB invocation string (default 'gdb')
" F7 to restore vim default mapping

" Hightlight extra space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" hightlight temp keyword by using \* and clear by \c
nmap <leader>* :syn match TempKeyword /\<<C-R>=expand("<cword>")<CR>\>/<CR>
nmap <leader>c :syn clear TempKeyword<CR>
hi TempKeyword ctermfg=red

" auto update cscope
nmap <F11> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>

" show ansi color
" :AnsiEsc

" open new tab and jump to the tag
map <C-[> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" ctrlp plugin
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_user_command = 'find %s -type f'       " MacOSX/Linux
"let g:ctrlp_open_new_file = 'v'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"let g:ctrlp_clear_cache_on_exit = 0 " dont clean cache when leaving vim
"let g:ctrlp_max_files = 1000000 " increate cache files to avoid missing file
"Pressing <c-o> or <c-y> will then prompt for a keypress. The key can be:
"  t - open in tab(s)
"  h - open in horizontal split(s)
"  v - open in vertical split(s)
"  i - open as hidden buffers (for <c-o> only)
"  c - clear the marked files (for <c-o> only)
"  r - open in the current window (for <c-y> only)
"  <esc>, <c-c>, <c-u> - cancel and go back to the prompt.
"  <cr> - use the default behavior specified with
"  |g:ctrlp_open_new_file| and
"  |g:ctrlp_open_multiple_files|.

"ack.vim
":Ack [options] {pattern} [{directory}]
" ack doc: http://betterthangrep.com/
" o    to open (same as enter)
" go   to preview file (open but maintain focus on ack.vim results)
" t    to open in new tab
" T    to open in new tab silently
" v    to open in vertical split
" gv   to open in vertical split silently
" q    to close the quickfix window
"let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:ackprg="gid_with_col.py"
nnoremap <silent> <Leader>g :Ack<CR>

" clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" customized setting
so ~/.vimrc_private
