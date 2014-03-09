" Vim support file to detect file types
"
" Language:     MIG
" URL:          https://github.com/Flast/mig.vim

if exists("did_load_mig_filetypes")
    finish
endif
let did_load_mig_filetypes=1

au BufNewFile,BufRead *.defs    setf mig
