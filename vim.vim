#append to position
a

#append at the end of the line
A

#insert before position
i

#insert at the beginning of the line
I

#new line and text there
o
#new line above and text there
O

#left,right,up,down
l,h,k,j

#move forward and backward
ctrl+F ctrl+B

#single page forward and backward
ctrl+f ctrl+b

#move up and down
ctrl+U ctrl+D

#move to the end/beginning of the line
$ 0

#autocomplete word (previous-next word)
ctrl+p ctrl+n

#select text
v (select range with arrows)
V (select entire line)
shift+v (row selection)
gv (gives the previous selection)
v+i+block_character (select all the rows between the character)
ctrl+v (select columns)
v+i+w (word selection)

#copy, paste, delete
y (copy)
p (paste after)
P (paste before)
d (delete/cut)

#search pattern
/pattern (search forward)
?pattern (search backward)
n (repeat forward search)
N (repeat backward search)
% (all file)
:%s /search_for_this/replace_with_this/ (search and replace)
:%s /search_for_this/replace_with_this/gc (g means globally - confirm each replace)
:%s /search/replace/gc (interactive global replace)
:%s //foo/gc (if empty uses last search as parameter)
:%s /\<word\>/gc (search for the complete word)
/word/gj **/*.* (search the "word" globally without stop to the first match recursively in the all files of the project)
:lw (list all the words found)
set incsearch (incremental highlight of a search)
set hlsearch - hls (highlight searched word)
nohlsearch - nohl (disable hlsearch)
* (highlight the word under the cursor in the document. And go forward)
# (go back to the previous word)
nnoremap n nzz (remap n command to center the page at every search result))
nnoremap N Nzz (remap N command to chenter the page at every search result)
nnoremap ws :w<CR>:SwiftRun<CR> (map ws to save and run a swift file)

#word uppercase/lowercase
gu (moves the selection to lowercase)
gU (moves the selection to uppercase)

#using register
ctrl+r {register} (pasting in insert mode)
"{register}p (pasting in command mode from register)
"{register}y (copying in command mode to register)
"* (clipboard register)
"_ (register for complete deletion, without cutting)
reg (show registers)

#line concatenation
SHIFT+j (concatenate the row below)

#code indent
< (indent back)
> (indent forward)
= (auto)

#screen split
vsplit file (vertical split)
split file (horizzontal split)
ctrl+w s (splits vertically)
ctrl+w v (splits horizzontal)
ctrl+w = (same dimension)
[n]ctrl+w [n]> (move forward of n columns. n could be everywhere)
[n]ctrl+w [n]< (move backward of n columns. n could be everywhere)
ctrl+w arrow (move between panels)
ctrl+w shift+arrow (move a panel)

#buffer (file) handling
:ls (shows opened buffers)
:b index (open buffer 'index')
:b unique_file_name_part (open file with that unique part name)
ctrl+o (backward buffer cursor)
ctrl+i (forward buffer cursor)
ctrl+^ (last opened buffer)

#diff
diffsplit file (diff with current buffer and file - horizontally)
vertical diffsplit file (diff vertically)
diffthis (put the diffmode for the current buffer)
diffoff (exit from diff mode)
do (get the changes from the other windows into the current one)
dp (put the changes form current window to the other one)
]c (jump to the next change)
[c (jump to the previous change)

#Cursor line
set cursorline
hi clear CursorLine (clear previous colorscheme)
hi CursorLine ctermbg=232 (set background cursor line color to 232)

#Swap lines,words and characters
xp (swap current char with the next)
Xp (swap current char with the previous)
ddp (swap current line with the next)
ddkkp (swap current line with the previous)
dawelp (swap current word with the next)
dawbP (swap current word with the previous)

#Remapping command
#example nnoremap ,h nohl <cr> #remapping  nohl + return with ,h
nnoremap (n - normal mode, nore - recursive, map - mapping)
inoremap (i - insert mode)
vnoremap (v - visual mode)

#Macro (record operation)
q1 (starts recording in register "1")
q  (stop recording. Remember to go in normal mode (ESC))
@1 (executes macro)
#how to execute on multiple lines:
# 1:
#     -select rows in visual mode
#     -go in command mode: norm @1 (norm is like each)
# 2:
#    -register the macro and the last operation is going one line down

#NERDTree
ctrl+ww (switch between text and file tree)
/file (search)

#vim on terminal
set t_Co=256 (enables 256 colors in vim for xterm-256)

#Multi Cursor plugin
ctrl+n (multi selection)
ctrl+p (back)
ctrl+x (jump a selection)
