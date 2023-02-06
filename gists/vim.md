## delete in netrw
Shift + D

## indent
`visual > or <` 

## auto indent
`gg=G`

## new file in netrw
`%`

## select all lines and delete
`:%d`

## cycle through window panes
`crtl+W`

## netrw help quickmap reference
`help netrw`

## search and replace
`:%s/search/replace/g`

## tabnew
`:tabnew`

## end of file
`shift+G`

## delete line
`Shift+D`

## select word
`viw`

## recent file 
`ctrl+p`

## terminal in window
`term`

## vertical split pane
`vsp`

## code formatting
shift-v to visually highlight

= to format code

## terminal
```
:term
:tab ter
```

## wrap
```
:set wrap
:set nowrap
```

## Go to last accessed tab
```
g<Tab>		Go to previous (last accessed) tab page.
```

## format json in vim
```
:%!python -m json.tool
```

## format json in neovim
brew install jq
```
:%!jq .
```

## next tab
```
gt
```

## prev tab
```
gT
```

## Run command inside vim
```
!git status
```

## Spellcheck
```
set spell
set nospell
```

## close single buffer
- https://stackoverflow.com/questions/1269648/how-do-i-close-a-single-buffer-out-of-many-in-vim
buffer id and buffer wipe
```
1bw
```

## neovim terminal
- To map <Esc> to exit terminal-mode
- https://neovim.io/doc/user/nvim_terminal_emulator.html
```
:terminal
```

## Refresh netrw
```
:E
```

## new file command
```
:e helloworld
```
