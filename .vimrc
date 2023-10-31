" use Zenburn colour scheme (this is just my preference; default is fine)
" set t_Co=256
" color zenburn

set number

" make tab be 4 spaces
set expandtab
set shiftwidth=4
set tabstop=4

" prevent command-t from taking forever (limit to 30k files)
let g:CommandTMaxFiles=30000

" use Python syntax highlighting
" filetype on
" filetype plugin indent on
" autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

" format JSON files properly
au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" Strip trailing spaces on Python, JS, CSS, HTML, and TPL files
autocmd BufWritePre *.py,*.js,*.css,*.html,*.tpl :%s/\s\+$//e

" ignore .pyc, .o, and .git in command-t and :e
set wildignore+=*.pyc,*.o,.git

" Use F2 to enter "paste mode"... this disables auto indenting for when you're
" pasting in text that's already indented
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Use F3 to toggle line numbers, to help when copying
nnoremap <F3> :set nonumber!<CR>

" Map CTRL+o to open vertically split pane
let g:CommandTAcceptSelectionSplitMap='<C-o>'

" If you type "imppdb", it will be replaced with a PDB breakpoint
ab imppdb import pdb;pdb.set_trace()

" Make indenting and unindenting block selections not lose the selection
vnoremap < <gv
vnoremap > >gv

" When editing a file that requires root, try to save using sudo
cmap w!! %!sudo tee > /dev/null %

" for use when splitting
noremap <C-H> <C-W><C-H>
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>

set splitbelow
set splitright

set ruler
set cursorline
