# Vim & Neovim

## Getting started

1. Copy init.vim
2. Install Vim plug
3. Install plugins
```
PlugInstall
```

## Commands

### delete in netrw
```
Shift + D
```

### indent
```
visual > or <
``` 

### auto indent
`gg=G`

### new file in netrw
`%`

### select all lines and delete
`:%d`

### cycle through window panes
`crtl+W`

### netrw help quickmap reference
`help netrw`

### search and replace
`:%s/search/replace/g`

### tabnew
`:tabnew`

### end of file
`shift+G`

### delete line
`Shift+D`

### select word
`viw`

### recent file 
`ctrl+p`

### vertical split pane
`vsp`

### code formatting
shift-v to visually highlight

= to format code

### terminal
```
:term
:tab ter
```

### exit terminal process
```
ii
```

### wrap
```
:set wrap
:set nowrap
```

### Go to last accessed tab
```
g<Tab>		Go to previous (last accessed) tab page.
```

### format json in vim
```
:%!python -m json.tool
```


### next tab
```
gt
```

### prev tab
```
gT
```

### Run command inside vim
```
!git status
```

### Spellcheck
```
set spell
set nospell
```

### close single buffer
- https://stackoverflow.com/questions/1269648/how-do-i-close-a-single-buffer-out-of-many-in-vim
buffer id and buffer wipe
```
1bw
```

### Refresh netrw
```
:E
```

### new file command
```
:e helloworld
```

### close all windows
```
:qa
```

### goto beginning of line and insert mode
```
shift+i
```

### Replace with yanked word
```
yiw
viwp
```

### Paste without formatting
```
:set paste
```

### multiple line edit for comments
esc will execute on all lines
```
ctrl+v
shitf+i
```

### Go to the beginning of a line with Vim
```
_
```

## split windows
```
vsp new
sp new
```

### highlight or search the word under the cursor
```
*
```

### select up to relative lines
`shitf+v 4j`

### select previous relative lines
`shift+v 4k`

### jump to relative lines
```
5j
5k
```

### clear search
no highlight
```
:noh
```

### Refresh netrw
```
r at the top of the list
```

# Compare two files
`vimdiff file1 file2`
