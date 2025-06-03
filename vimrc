"## This is my personal vimrc ##
"
" ## System Configurations ##

" encoding
scriptencoding utf-8
set encoding=utf-8

"enable omnicompletion for functions and objects and spelling
set omnifunc=syntaxcomplete#Complete

" spelling language
set spelllang=en

" copy to mac clipboard. The unnamed is a safer cross platform way to paste
" text from yank or from the system clipboard. Using ^= to prepend
set clipboard^=unnamed

" Set compatibility to Vim only.
set nocompatible

" ## Workspace customization ##

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Show line numbers
set number

" color characters in lines with more that 80 characters
highlight ColorColumn ctermbg=magenta guibg=Magenta
call matchadd('ColorColumn', '\%81v', 100)

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" ## Key mappings ##

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" new command to open new tab in the script directory
command! tabhere tabnew %:p:h | Ex

" ## PLUGINS customization ##

" Pathogen package manager
execute pathogen#infect()

" to load the netrw for browsing files inside vim. This is not a plugin.
set nocp
let g:netrw_liststyle = 3 " make the default viewing style the tree view. 

" For plug-ins to load correctly.
filetype plugin indent on

" vim-latex-preview plugin
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

" vimtex
" Vim uses a giant heuristic to determine plaintex vs other variations of tex.
" g:vimtex_latexmk_options
let g:tex_flavor = 'latex'
let g:vimtex_view_method='general'

" Nvim-R plugin, require 2 underscores to insert the R assign symbol
let R_assign = 2

" csv.vim plugin set delimiters
let g:csv_delimiter = ";"
let g:csv_delimiter = "\t"

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" ## Colors, text highlighting ##

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

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" ## Indentation and text appearance ##

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
set expandtab " change the tab character with spaces 
set shiftwidth=4 " this command changes the number of spaces inserted with tab in the current document to 4. To activate this setting the command :retab must be run
set tabstop=4 " set the number of spaces inserted when pressing tab key to 4
set softtabstop=4
set autoindent
set smartindent 
set foldmethod=syntax

" Fixes common backspace problems
set backspace=indent,eol,start

" ## SEARCH ##

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" ## File loading and buffers ##

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

" ## Undo make persistent ##

set undodir=~/.vim/undodir
set undofile " Maintain undo history between sessions

" ## load text files using pandoc

autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

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
