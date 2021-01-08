set nocompatible              " be iMproved, required
set clipboard=unnamed
filetype off                  " required

" VimPlug  is the plugin manager

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plug 'FredKSchott/CoVim'
Plug 'Raimondi/delimitMate' "auto close quotes, paren, etc
Plug 'airblade/vim-gitgutter'
" Plug 'blindFS/vim-taskwarrior'
Plug 'bling/vim-airline'
Plug 'chr4/nginx.vim'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mileszs/ack.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'peterhoeg/vim-qml'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'samsonw/vim-task'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-vinegar'
Plug 'trayo/vim-ginkgo-snippets'
Plug 'trayo/vim-gomega-snippets'
Plug 'vim-scripts/dbext.vim'
Plug 'vim-scripts/loremipsum'
Plug 'vim-scripts/SyntaxRange'
" Plug 'wakatime/vim-wakatime'
Plug 'wavded/vim-stylus'
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'google/protobuf', { 'rtp': 'editors' }
Plug 'wagnerf42/vim-clippy'
Plug 'Valloric/MatchTagAlways'
Plug 'apple/swift'
" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
" Plug 'dense-analysis/ale'

if !has('nvim')
  Plug 'valloric/YouCompleteMe'
  " Let YCM load config files in code folder automatically
  let g:ycm_extra_conf_globlist = ['~/code/*','!~/*']
  let g:ycm_complete_in_comments = 1
  let g:ycm_seed_identifiers_with_syntax = 1
  let g:ycm_add_preview_to_completeopt = 1
  let g:ycm_autoclose_preview_window_after_insertion = 1
  """"""""" Snippets """""""""""
  " Track the engine.
  Plug 'SirVer/ultisnips'
endif

if has('nvim')
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'zchee/deoplete-go', { 'do': 'make'}
  " Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

  " autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  " " <CR>: If popup menu visible, expand snippet or close popup with selection,
  " "       Otherwise, check if within empty pair and use delimitMate.
  " inoremap <silent><expr><CR> pumvisible() ?
  "   \ (neosnippet#expandable() ? neosnippet#mappings#expand_impl() : deoplete#close_popup())
  "     \ : (delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : "\<CR>")

  " <Tab> completion:
  " 1. If popup menu is visible, select and insert next item
  " 2. Otherwise, if within a snippet, jump to next input
  " 3. Otherwise, if preceding chars are whitespace, insert tab char
  " 4. Otherwise, start manual autocomplete
  " imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  "   \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  "   \ : (<SID>is_whitespace() ? "\<Tab>"
  "   \ : deoplete#manual_complete()))

  " smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  "   \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  "   \ : (<SID>is_whitespace() ? "\<Tab>"
  "   \ : deoplete#manual_complete()))

  inoremap <expr><S-Tab>  pumvisible() ? "\<Up>" : "\<C-h>"

  function! s:is_whitespace() "{{{
    let col = col('.') - 1
    return ! col || getline('.')[col - 1] =~? '\s'
  endfunction "}}}
endif

" LanguageClient for neovim - gives linter, renamer, and go to definition
" support from Microsoft
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

call plug#end()

filetype plugin indent on    " required

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set nowritebackup
set history=50 " keep 50 lines of command line history
set ruler      " show the cursor position all the time
set showcmd    " display incomplete commands
set incsearch  " do incremental searching

" disable completopt preview
set completeopt=menuone

" Use deoplete
" JS linter / syntax config.
" let g:deoplete#enable_at_startup = 1
" Limit autocomplete to 10
set pumheight=10

" Don't use Ex mode, use Q for formatting
map Q gq

" Colors
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" colorscheme monokai
colorscheme railscasts
syntax enable

" Enable the following to keep terminal color
"hi Normal guibg=NONE ctermbg=NONE
hi clear SignColumn


" Show line numbers
set number
set numberwidth=5

" Turn on Mouse Capture
set mouse=a
if !has('nvim')
  " Add support for iTerm2 and Large windows
  if has('mouse_sgr')
    set ttymouse=sgr
  endif
endif

" Switch wrap off for everything
set formatoptions=tcqw
set nowrap
set textwidth=80
set colorcolumn=80

" Softtabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" \ is the leader character
let mapleader = ","

" Go mappings
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gbd <Plug>(go-build)
au FileType go nmap <leader>gtst :GoTest<CR>
au FileType go nmap <leader>gtf :GoTestFunc<CR>
au FileType go nmap <leader>gcov <Plug>(go-coverage)
au FileType go nmap <Leader>gdoc <Plug>(go-doc)
au FileType go nmap gds <Plug>(go-def-split)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>s <Plug>(go-implements)

" Swap header and implementation
map <leader>sw :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Run Make - this runs the !make
map <leader>mk :Make<CR>
map <leader>mkr :Make run<CR>

" Run make - this runs makeprg
map <leader>r :make<CR>

" Tasks
map <leader>tt :call Toggle_task_status()<CR>

" Don't confirm switching when a buffer is not saved
set hidden

" Default to syntax based folding
set foldmethod=syntax

if has("autocmd")
  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text
  autocmd BufNewFile,BufRead todo.txt,*.task,*.tasks,*.todo  setfiletype task
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Enable indent folds for tasks
  autocmd FileType task set foldmethod=indent

  " Enable indent folds for qml
  autocmd FileType qml set foldmethod=indent

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END
endif

set foldenable
set foldlevelstart=10
set foldnestmax=10
noremap <space> za

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" Display extra whitespace
"set list listchars=tab:»·,trail:·
" Delete trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Use Ag instead of Grep when available
if executable("ag")
  set grepprg="ag --vimgrep"
  let g:ackprg = 'ag --vimgrep'
endif

" Enable Ninja if available
if executable("ninja") && filereadable("./build.ninja")
  command! Ninja execute "!ninja"
  set makeprg=ninja
endif

" Tags
map <Leader>` :TagbarToggle<CR>
set tags=./tags;

" Friendly save - will not re-enter insert mode
nmap <Leader>w :w<CR>
imap <Leader>w <Esc><Leader>w
" will restore visual select
vmap <Leader>w <Esc><Leader>wgv

" Beautification / prettier plugin
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

nmap <Leader>a= :Tabularize decl_assign<CR>
vmap <Leader>a= :Tabularize decl_assign<CR>
nmap <Leader>a: :Tabularize /:/l2r2<CR>
vmap <Leader>a: :Tabularize /:/l2r2<CR>


if !has("nvim")
  " Configure Ultisnips + YCM to play nice
  let g:UltiSnipsExpandTrigger = "<nop>"
  let g:ulti_expand_or_jump_res = 0
  function! ExpandSnippetOrCarriageReturn()
      let snippet = UltiSnips#ExpandSnippetOrJump()
      if g:ulti_expand_or_jump_res > 0
          return snippet
      else
          return "\<CR>"
      endif
  endfunction
  inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
endif

" Local config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Ale
" let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'css': ['prettier'],
" \}
" let g:ale_fix_on_save = 1
" let g:ale_linters = {
" \   'javascript': ['prettier'],
" \   'go': ['gofmt', 'gometalinter'],
" \   'rust': ['cargo', 'rls'],
" \}
" set autoread
" Ale

" Change CamelCase to snake_case
nmap <Leader>cts :s#\(\<\u\l\+\\|\l\+\)\(\u\)#\l\1_\l\2#g<CR>
vmap <Leader>cts :s#\%V\(\<\u\l\+\\|\l\+\)\(\u\)#\l\1_\l\2#g<CR>

" Ctrl-P Hide build/dist folders
let g:ctrlp_custom_ignore = '\v(build|dist|tmp|bower_components|node_modules|cordova|build_cache|Godeps)$'

" Setup Vim Test
let test#strategy = "asyncrun"
let test#go#runner = 'ginkgo'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Auto open QuickFix window when tests run
function! CloseQuickFixOnSuccess()
    if g:asyncrun_status =~ "success"
        call asyncrun#quickfix_toggle(8, 0)
    endif
endfunction

augroup vimrc
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
    autocmd User AsyncRunStop call CloseQuickFixOnSuccess()
augroup END

" Use Go Imports
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"


" Project Specific VimRC
set exrc
set secure

" Customize syntax highlighting
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

au BufRead,BufNewFile * syn match simpleIterator '\C[^a-zA-Z][ijk][^a-zA-Z]'

function! CustomizeSyntax()
  if has('nvim')
    highlight Comment cterm=italic ctermfg=137
  endif
  if !has('nvim')
    highlight Comment cterm=italic ctermbg=bg ctermfg=137
  endif
  highlight Identifier cterm=italic
  highlight Constant cterm=bold
  highlight simpleIterator cterm=italic
  highlight Special ctermfg=67
  highlight ColorColumn ctermbg=black
endfunction
au BufRead,BufNewFile * call CustomizeSyntax()

" Rust Lang
function! SetRustOptions()
  let g:rustfmt_autosave = 1 " Enable auto format on save
  let g:ycm_rust_src_path = $RUST_SRC_PATH
  let g:rust_fold=1
  set textwidth=99
  set colorcolumn=99
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endfunction
au FileType rust call SetRustOptions()

if &term =~ 'tmux'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" LanguageClient
" Required for operations modifying multiple buffers like rename.
" set hidden

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"     \ }

" nnoremap <F5> :call LanguageClient#contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" " nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" " Required for operations modifying multiple buffers like rename.
" set hidden

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"     \ }

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" " CocVim intellisense with language server protocol
" " TextEdit might fail if hidden is not set.
" set hidden

" " Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" " Give more space for displaying messages.
" set cmdheight=2

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300

" " Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings using CoCList:
" " Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" " CocVim intellisense with language server protocol
