" encoding
scriptencoding utf-8
set encoding=utf-8

" Pathogen package manager
execute pathogen#infect()

" For plug-ins to load correctly.
filetype plugin indent on
"enable omnicompletion for functions and objects and spelling
set omnifunc=syntaxcomplete#Complete


" vim-latex-preview plugin
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

" vimtex
" Vim uses a giant heuristic to determine plaintex vs other variations of tex.
" g:vimtex_latexmk_options
let g:tex_flavor = 'latex'
let g:vimtex_view_method='general'

" copy to mac clipboard. The unnamed is a safer cross platform way to paste
" text from yank or from the system clipboard. Using ^= to prepend
set clipboard^=unnamed

" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" color scheme
colorscheme desert

if &diff
      colorscheme default
    endif

" set the color of the highlight boxes. It has to be below the colorscheme in
" order to work
highlight Pmenu ctermbg=244 gui=bold

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set noshiftround
set shiftwidth=4 " this command changes the number of spaces inserted with tab in the current document to 4. To activate this setting the command :retab must be run
set tabstop=4 " set the number of spaces inserted when pressing tab key to 4
set softtabstop=4
set expandtab " change the tab character with spaces 
set autoindent
set smartindent "

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"


" Copy paste system cliboard

"function! Osc52Yank()
"      let buffer=system('base64 -w0', @0)
"          let buffer=substitute(buffer, "\n$", "", "")
"              let buffer='\e]52;c;'.buffer.'\x07'
"                  silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape("/dev/pts/30")
"                endfunction
"                command! Osc52CopyYank call Osc52Yank()
"                augroup Example
"                      autocmd!
"                          autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
"                        augroup END
"
