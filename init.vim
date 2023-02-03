" ---------------------------------------------------------------------------------------------------
" vim-plugin 
" ---------------------------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree-project-plugin'
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
" grepper is an Subset of LeaderF, so remove it.
" Plug 'mhinz/vim-grepper'
" restore cursor to file position in previous editing session
Plug 'farmergreg/vim-lastplace'

" plugin for rust
Plug 'rust-lang/rust.vim'

" plugin for intensely nerdy commenting powers
Plug 'preservim/nerdcommenter'
" Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'

Plug 'mattn/webapi-vim'
Plug 'preservim/tagbar'
" an efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly.
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'whalecold/ZoomWin'
Plug 'APZelos/blamer.nvim'
"Plug 'dkprice/vim-easygrep'
"Plug 'othree/eregex.vim'
Plug 'jreybert/vimagit'
Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
"Plug 'folke/neodev.nvim'
"Plug 'leoluz/nvim-dap-go'
call plug#end()

" -------------------------------------------------------------------------------------------------
"  vimgit settings
" -------------------------------------------------------------------------------------------------
" Open vimagit pane git status
nnoremap <leader>gs :Magit<CR>       
" Push to remote
nnoremap <leader>gp :! git push<CR>
" Enable deletion of untracked files in Magit
let g:magit_discard_untracked_do_delete=1

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
au FileType go nmap <silent> gut <Plug>(go-test-func)
autocmd FileType go nnoremap <buffer> <C-]> :GoFmtAutoSaveToggle<cr>
autocmd FileType go nnoremap <buffer> gfm :GoImports<cr>
autocmd FileType go nnoremap <buffer> <leader>li :GoMetaLinter<cr>

" let g:go_fmt_autosave = 0
" let g:go_imports_autosave = 0
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
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }


" -------------------------------------------------------------------------------------------------
" NERDTree.nvim default settings
" -------------------------------------------------------------------------------------------------

" short cut for opening and closing NERDTree
map <F3> :NERDTreeToggle<CR>
nmap <Leader>rr :NERDTreeFocus<cr>R<c-w><c-p>
let NERDTreeShowBookmarks=1

" -------------------------------------------------------------------------------------------------
" misc default settings
" -------------------------------------------------------------------------------------------------
colorscheme gruvbox
set tabstop=4
set nu
set shiftwidth=4
set autoindent
set termguicolors
" set ignorecase
set smartcase
" copy from nvim to system clipboard
set clipboard+=unnamedplus
set mmp=5000
set autowriteall
" auto set the cwd to cur files
" set autochdir
syntax enable
filetype plugin indent on
" nnoremap <buffer> <C-[> :W<cr>


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
"
" -------------------------------------------------------------------------------------------------
" grepper default settings 
" -------------------------------------------------------------------------------------------------
"cnoremap <c-n> <down>
"cnoremap <c-p> <up>
"
"nmap gs <plug>(GrepperOperator)
"xmap gs <plug>(GrepperOperator)
"
"nnoremap <leader>gg :Grepper -tool git<cr>
"nnoremap <leader>ga :Grepper -tool ag<cr>
"nnoremap <leader>gs :Grepper -tool ag -side<cr>
"nnoremap <leader>*  :Grepper -tool ag -cword -noprompt<cr>
"
"let g:grepper = {}
"let g:grepper.tools = ['git', 'ag', 'grep']
"let g:grepper.open = 0
"let g:grepper.jump = 0
"let g:grepper.prompt_mapping_tool = '<leader>g'

"let g:EasyGrepCommand=1
"let g:EasyGrepPerlStyle=1

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

" -------------------------------------------------------------------------------------------------
" rust settings
" -------------------------------------------------------------------------------------------------
let g:rustfmt_autosave = 1


nmap <F4> :TagbarToggle<CR>


" -------------------------------------------------------------------------------------------------
" leaderF settings
" -------------------------------------------------------------------------------------------------
" let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bugTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fw :<C-U><C-R>=printf("Leaderf window %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


" imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-j> <Plug>(coc-snippets-select)
"

"============================ blamer.nvim =================
let g:blamer_enabled = 1
let g:blamer_template = '<author> <author-time> <summary>'
"============================ blamer.nvim =================

"============================== coc-git ====================================
" navigate chunks of current buffer
"nmap [g <Plug>(coc-git-prevchunk)
"nmap ]g <Plug>(coc-git-nextchunk)
"" navigate conflicts of current buffer
"nmap [c <Plug>(coc-git-prevconflict)
"nmap ]c <Plug>(coc-git-nextconflict)
"" show chunk diff at current position
"nmap gs <Plug>(coc-git-chunkinfo)
"" show commit contains current position
"nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
"omap ig <Plug>(coc-git-chunk-inner)
"xmap ig <Plug>(coc-git-chunk-inner)
"omap ag <Plug>(coc-git-chunk-outer)
"xmap ag <Plug>(coc-git-chunk-outer)


" lightline
"let g:lightline = {
"  \ 'active': {
"  \   'left': [
"  \     [ 'mode', 'paste' ],
"  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
"  \   ],
"  \   'right':[
"  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
"  \     [ 'blame' ]
"  \   ],
"  \ },
"  \ 'component_function': {
"  \   'blame': 'LightlineGitBlame',
"  \ }
"\ }
"
"function! LightlineGitBlame() abort
"  let blame = get(b:, 'coc_git_blame', '')
"  " return blame
"  return winwidth(0) > 120 ? blame : ''
"endfunction

"============================== coc-git ====================================
lua require("plugins")

nnoremap <leader>gb  :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <leader>gc  :lua require'dap'.continue()<cr>
nnoremap <leader>gn  :lua require'dap'.step_over()<cr>
