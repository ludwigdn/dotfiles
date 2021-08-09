augroup MyCustomAutoGroup
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  " Use actual tab chars in Makefiles.
  autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
  " Start NERDTree when Vim starts with a file argument.
  autocmd VimEnter * if argc() > 0 || exists("s:std_in") | NERDTree | wincmd p | endif
  " Start NERDTree when Vim starts with a directory argument.
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0]  | endif
  " Exit Vim if NERDTree is the only window left.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  " Better syntax highlighting for large files
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
  " call function to auto-trim whitespaces at end of lines
  autocmd BufWritePre * :call TrimWhitespace()
  " This sets the file formats to unix, avoiding ^M errors when coming from dos
  autocmd BufWritePre * :set fileformat=unix
  " Auto source .vimrc file at saving
  autocmd BufWritePost .vimrc :so %
augroup END

