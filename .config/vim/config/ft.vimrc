autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType c,cuda,cpp setlocal shiftwidth=2 tabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.ts setlocal filetype=typescript
autocmd BufRead,BufNewFile *.tf setlocal filetype=json
autocmd BufRead,BufNewFile *.asm setlocal filetype=nasm
autocmd BufRead,BufNewFile *.BUILD setlocal filetype=bzl

autocmd BufRead,BufNewFile *.ui setlocal filetype=xml
autocmd BufRead,BufNewFile *.launch setlocal filetype=xml

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2



" Don't indent c++ namespaces
autocmd FileType cpp set cinoptions=:0,l1,g0,t0,i0,(0,w1,N-s
autocmd FileType h set ft=cpp
