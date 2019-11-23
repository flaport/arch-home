"    _____ _     ____  ____  ____  ____  _____
"   /    // \   /  _ \/  __\/  _ \/  __\/__ __\
"   |  __\| |   | / \||  \/|| / \||  \/|  / \
"   | |   | |_/\| |-|||  __/| \_/||    /  | |
"   \_/   \____/\_/ \|\_/   \____/\_/\_\  \_/
"

"" Plugins
"-------------------------------------------------------------------------------

" set leader key
let mapleader = " "

" loader plugins
source ~/.config/nvim/plugins.vim

" load snippets
source ~/.config/nvim/snippets/snippets.vim


"" Settings
"-------------------------------------------------------------------------------

" enable different behavior for different filetypes:
set nocompatible
filetype plugin on

" automatically cd into folder of current file
autocmd BufEnter * silent! lcd %:p:h

" underline current line if in insert mode
autocmd InsertEnter * set cul

" remove underline when in normal mode
autocmd InsertLeave * set nocul

" clear trailing spaces in python files at saving
autocmd BufWritePre *.py %s/\s\+$//e

" save on focus lost
au FocusLost * :wa

" enable syntax highlighting
syntax enable

" enable all Python syntax highlighting features
let python_highlight_all = 1

" enable undo after file save
set undofile
set undodir=$HOME/.local/share/nvim/undo

" save as sudo (make sure SUDO_ASKPASS is set to a password asking program)
ca w!! w !sudo -A tee '%' &> /dev/null

" remove ugly vertical lines in split
set fillchars+=vert:\

" fix problems with uncommon shells (fish, zsh, xonsh, ...) and plugins
" running shell commands (neomake, ...)
set shell=/bin/bash

" set a column at 90 characters
set colorcolumn=90

" disable line wrapping
set nowrap

" allow pattern matching with special characters
set magic

" relative line numbering
set relativenumber

" new vertical splits appear on the right
set splitright

" new horizontal splits appear below
set splitbelow

" enable unicode
set encoding=utf-8

" case insensitive search when searching with lower case characters
set ignorecase

" case sensitive search when searching with upper case characters
set smartcase

" copy to star register by default (selection copy)
set clipboard^=unnamed

" show line numbers
set number

" set tabs to have a width of 4 spaces
set tabstop=4

" set tabs to have a maximum width of 4 spaces
set softtabstop=4

" set the shift operators (`<<` and `>>`) to insert 4 spaces
set shiftwidth=4

" replace tabs by spaces
set expandtab

" disable automatic indent when moving to the next line while writing code
set noautoindent

" show the matching part of the pair for [] {} and ()
set showmatch

" when scrolling, keep cursor in the middel of the page
set scrolloff=1000

" code folding
" zM: fold all; zR: unfold all; za: toggle fold, zv: unfold one; zc: fold one
set foldmethod=indent

" allow opening a new buffer without saving the current one
set hidden

" left margin
hi FoldColumn ctermbg=NONE
set foldcolumn=2

" lower updatetime (for vim signify)
set updatetime=200

" tex / latex / xelatex
autocmd FileType tex set nonumber
autocmd FileType tex set norelativenumber
autocmd FileType tex set textwidth=70
autocmd FileType tex set foldcolumn=8
autocmd FileType tex set colorcolumn=0


"" Custom commands
"-------------------------------------------------------------------------------

command! -nargs=* T term <args>
command! -nargs=* HT split | resize 10 | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" make tag (may need to install ctags first)
command! MakeTags !ctags -R .


"" Special keyboard shortcuts
"-------------------------------------------------------------------------------

" easier access to command mode
nnoremap ; :

" back to normal mode
inoremap jj <Esc>

" go to edit mode in terminal emulator:
tnoremap <Esc> <C-\><C-n>

" add a word to the dictionary (enable spell checker with F3)
" zg " standard vim keybinding

" remove word from dictionary (enable spell checker with F3)
" zuw " standard vim keybinding

" go to next misspelled word (enable spell checker with F3)
" ]s " standard vim keybinding

" go to previous misspelled word (enable spell checker with F3)
" [s " standard vim keybinding

" show suggestion for misspelled word (enable spell checker with F3)
" z= " standard vim keybinding


"" Ctrl based keyboard shortcuts
"-------------------------------------------------------------------------------

" make current split the only split
nnoremap <C-a> :only<cr>
tnoremap <C-a> <C-\><C-N>:only<cr>

" close split Below
nnoremap <C-b> <C-w>j:q!<CR>

" exit current buffer without saving
inoremap <C-c> <Esc>:bd!<CR>
nnoremap <C-c> <Esc>:bd!<CR>

" down half screen
" <C-d> " standard vim keybinding

" scroll text up with cursor staying where it is
" <C-e> " standard vim keybinding

" down full screen
" <C-f> " standard vim keybinding

" show status
" <C-g> " standard vim keybinding

" move to split left of current split
nnoremap <C-h> <C-w>h
tnoremap <C-h> <C-\><C-N><C-w>h " navigation out of terminal mode

" jump to next position in text
" <C-i> = TAB " standard vim keybinding
autocmd FileType markdown nnoremap <C-i> 0v$"*y:read !~/.scripts/nvim/nvim_markdown_image<CR>kddk

" move to split below of current split
nnoremap <C-j> <C-w>j<C-A>
tnoremap <C-j> <C-\><C-N><C-w>j " navigation out of terminal mode

" move to split above of current split
nnoremap <C-k> <C-w>k
tnoremap <C-k> <C-\><C-N><C-w>k " navigation out of terminal mode

" move to split right of current split
nnoremap <C-l> <C-w>l
tnoremap <C-l> <C-\><C-N><C-w>l " navigation out of terminal mode

" move to first non-whitespace of next line
" <C-m> " standard vim keybinding

" cycle yankring forward
" <C-n> " inherited from yankring plugin

" jump to previous position in text
" <C-o> " standard vim keybinding

" cycle yankring backward
" <C-p> " inherited from yankring plugin

" save and exit
inoremap <C-q> <Esc>:wqa<CR>
nnoremap <C-q> <Esc>:wqa<CR>

" redo
" <C-r> " standard vim keybinding

" save buffer
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> <Esc>:w<CR>

" go one step back in tag stack
" <C-t> " standard vim keybinding

" up half screen
" <C-u> " standard vim keybinding

" visual block
" <C-v> " standard vim keybinding

" navigate between splits
" <C-w> " standard vim keybinding

" leader for autocomplete
" <C-x> " standard vim keybinding

" scroll text down with cursor staying where it is
" <C-y> " standard vim keybinding

" suspend (like any other terminal process)
" <C-z> " standard shell keybinding

" cancel / go to normal mode
" <C-[> :bprevious<CR> " disabled as this is the Esc combination

" use word under cursor to open next file with that tag
" <C-]> " standard vim keybinding

" go to last open buffer
" <C-^> " standard vim keybinding 


"" Leader based keyboard shortcuts
"-------------------------------------------------------------------------------

" turn of highlighting
nnoremap <leader><leader> :noh<cr>

" open next buffer
nnoremap <leader>] :bnext<CR>

" open previous buffer
nnoremap <leader>[ :bprevious<CR>

" fuzzy run vim command -- inherited from plugins
" <Leader>c

" go to definition (python only) -- inherited from plugins
" <Leader>d

" fuzzy open file -- inherited from plugins
" <Leader>e

" fuzzy find in file -- inherited from plugins
" <Leader>f

" toggle git diff symbols  -- inherited from plugins
" <Leader>g

" toggle relative line numbers
function! RelativeNumberToggle()
  if(&rnu == 1)
    set norelativenumber
    set nonumber
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>l :call RelativeNumberToggle()<CR>

" paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P


"<leader>s: latex synctex tex->pdf
function! SyncTex()
    " either do synctex on the pdf with basename [filename without extension] $TEXBASE,
    " or do synctex on the pdf with the same base name as the current tex file if
    " the environment variable $TEXBASE does not exist.
    exec "silent !test -z $TEXBASE && TEXBASE=%:p:r; zathura --synctex-editor-command 'nvr --servername ".v:servername." +\\%{line} \\%{input}' --synctex-forward ".line(".").":".col(".").":%:p $TEXBASE.pdf &"
endfunction
autocmd FileType tex nmap <Leader>s :call SyncTex()<CR>
"FYI: Ctrl-Click  --> latex synctex zathura pdf->tex

" swap splits (from https://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim#2591946)
" note that this only works when NOT in the main split.
function! Zoom()
    let g:markedWinNum = 1
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction
" zoom split:
nnoremap <leader>z :call Zoom()<CR><C-w>h<C-w>h<C-w>h<C-w>k<C-w>k<C-w>k


"" Function key keyboard shortcuts
"-------------------------------------------------------------------------------

" edit this configuration file (requires set hidden)
nnoremap <F2> :e ~/.config/nvim/init.vim<CR>
inoremap <F2> <Esc>:e ~/.config/nvim/init.vim<CR>

" enable spell checker:
nnoremap <F3> <Esc>:setlocal spell! spelllang=en_us<CR>
inoremap <F3> <Esc>:setlocal spell! spelllang=en_us<CR>
" use zg to add a word to the dictionary
" use zuw to remove word from dictionary
" use ]s and [s to navigate between misspelled words
" use z= to find a suggestion for the misspelled word

" source init.vim again.
nnoremap <F4> <Esc>:source ~/.config/nvim/init.vim<CR>
inoremap <F4> <Esc>:source ~/.config/nvim/init.vim<CR>

" run file
autocmd FileType python vnoremap <F5> "+y:silent !~/.scripts/nvim/nvim_run % SELECTION<CR>
autocmd FileType python nnoremap <F5> <Esc>:w<CR>:only<CR>:HT python -i %<CR>G<C-w>k
autocmd FileType python inoremap <F5> <Esc>:w<CR>:only<CR>:HT python -i %<CR>G<C-w>k
autocmd FileType tex nnoremap <F5> <Esc>:w<CR>:only<CR>:HT [ -f $TEXBASE.tex ] && latexmk -xelatex -cd -synctex=1 -interaction=nonstopmode -shell-escape $TEXBASE \|\| latexmk -f -xelatex -cd -synctex=1 -interaction=nonstopmode<CR>:sleep 100m<cr>G:sleep 100m<cr><C-w>k
autocmd FileType tex inoremap <F5> <Esc>:w<CR>:only<CR>:HT [ -f $TEXBASE.tex ] && latexmk -xelatex -cd -synctex=1 -interaction=nonstopmode -shell-escape $TEXBASE \|\| latexmk -f -xelatex -cd -synctex=1 -interaction=nonstopmode<CR>:sleep 100m<cr>G:sleep 100m<cr><C-w>k
autocmd FileType markdown vnoremap <F5> "+y:silent !~/.scripts/nvim/nvim_run % SELECTION<CR>

" python
autocmd FileType python nnoremap <F6> <Esc>:w<CR>:silent !~/.scripts/nvim/nvim_run %<CR>
autocmd FileType python inoremap <F6> <Esc>:w<CR>:silent !~/.scripts/nvim/nvim_run %<CR>


"" Marks
"-------------------------------------------------------------------------------
" m{letter} " Set mark
" `{letter} " jump to mark
" '{letter} " jump to beginning of line at mark


"" Searching
"-------------------------------------------------------------------------------

" /{pattern} " Search forward for {pattern}
" /{pattern}/{offset} " Search forward for {pattern} and go {offset} lines up or down.
" /<CR> 	Search forward for last used pattern
" n 	Repeat the latest "/" or "?" [count] times.
" N 	Repeat the latest "/" or "?" [count] times in opposite direction. 


"" Theme / colorscheme
"-------------------------------------------------------------------------------

" use 256 colors when possible
" set notermguicolors
" set termguicolors
" highlight clear

" custom colorscheme using only colors from ~/.Xresources.
colorscheme xresources

" white colorscheme
" colorscheme delek

" dark colorscheme
" colorscheme material

" fisa colorscheme
" colorscheme fisa

