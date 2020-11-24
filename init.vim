call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
" colorscheme
Plug 'morhetz/gruvbox'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" file search
Plug 'ctrlpvim/ctrlp.vim'
" grep plugin
Plug 'mhinz/vim-grepper'
" restore cursor to file position in previous editing session
Plug 'farmergreg/vim-lastplace'

" plugin for rust
Plug 'rust-lang/rust.vim'
Plug '907th/vim-auto-save'

" plugin for intensely nerdy commenting powers
Plug 'preservim/nerdcommenter'
"Plug 'dkprice/vim-easygrep'
"Plug 'othree/eregex.vim'
call plug#end()


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" -------------------------------------------------------------------------------------------------
" vim-go.nvim default settings
" -------------------------------------------------------------------------------------------------
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_info_mode = 'gopls'
let g:go_fmt_command = "goimports"
au FileType go nmap <silent> gie <Plug>(go-iferr)
au FileType go nmap <silent> gae <Plug>(go-alternate-edit)
au FileType go nmap <silent> gas <Plug>(go-alternate-split)
au FileType go nmap <silent> gav <Plug>(go-alternate-vertical)
au FileType go nmap <silent> lrn <Plug>(go-rename)

let g:go_highlight_array_whitespace_error    = 1
let g:go_highlight_chan_whitespace_error     = 1
let g:go_highlight_extra_types               = 1
let g:go_highlight_space_tab_error           = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators                 = 1
let g:go_highlight_functions                 = 1
let g:go_highlight_function_parameters       = 1
let g:go_highlight_function_calls            = 1
let g:go_highlight_types                     = 1
let g:go_highlight_fields                    = 1
let g:go_highlight_build_constraints         = 1
let g:go_highlight_generate_tags             = 1
let g:go_highlight_variable_declarations     = 1
let g:go_highlight_variable_assignments      = 1


" -------------------------------------------------------------------------------------------------
" NERDTree.nvim default settings
" -------------------------------------------------------------------------------------------------

" short cut for opening and closing NERDTree
map <F10> :NERDTreeToggle<CR>

" -------------------------------------------------------------------------------------------------
" misc default settings
" -------------------------------------------------------------------------------------------------
colorscheme gruvbox
set tabstop=4
set nu
set shiftwidth=4
set autoindent
set termguicolors
set ignorecase
set smartcase
" copy from nvim to system clipboard
set clipboard+=unnamedplus
let autosave=5


" -------------------------------------------------------------------------------------------------
" ctrlp default settings
" -------------------------------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
" for browsing the input history
"
" -------------------------------------------------------------------------------------------------
" grepper default settings
" -------------------------------------------------------------------------------------------------
cnoremap <c-n> <down>
cnoremap <c-p> <up>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nnoremap <leader>gg :Grepper -tool git<cr>
nnoremap <leader>ga :Grepper -tool ag<cr>
nnoremap <leader>gs :Grepper -tool ag -side<cr>
nnoremap <leader>*  :Grepper -tool ag -cword -noprompt<cr>

let g:grepper = {}
let g:grepper.tools = ['git', 'ag', 'grep']
"let g:grepper.open = 0
"let g:grepper.jump = 0
let g:grepper.prompt_mapping_tool = '<leader>g'

"let g:EasyGrepCommand=1
"let g:EasyGrepPerlStyle=1

" -------------------------------------------------------------------------------------------------
" auto save default settings
" -------------------------------------------------------------------------------------------------
let g:auto_save = 0  " enable AutoSave on Vim startup
let g:auto_save_silent = 0  " do not display the auto-save notification
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" -------------------------------------------------------------------------------------------------
" nerdcommenter settings
" -------------------------------------------------------------------------------------------------
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
