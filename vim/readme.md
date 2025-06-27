# .vimrc file to auto color and indent for bash scripts

<br>

> [!IMPORTANT]
> Copy this as .vimrc in users home directory

<br>


```vimrc
" Enable Syntax Highlighting
syntax on

" File Type Detection and Plugin Loading
filetype on
filetype plugin on
filetype indent on

" Set Default Tab Behaviour
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Customise Settings for bash and sh
augroup bash_settings
  autocmd!
  autocmd FileType sh,bash setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
augroup END

```
