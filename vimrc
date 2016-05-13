" For more comprehensive options - look at 
" http://amix.dk/vim/vimrc.html
 
let s:macmode = "N"
if has("macunix")
    let s:macmode = "Y"
endif
set termencoding=utf-8
set encoding=utf-8
"scriptencoding utf-8
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" required for vundle
filetype off
 
"if s:macmode == "Y"
"set rtp+=~/dotfiles/vim/bundle/vundle/
"call vundle#rc("~/dotfiles/.vim/bundle")
"else
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"   #endif
 
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
 
" My bundles here:
"
" original repos on GitHub
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
Plugin 'https://github.com/altercation/vim-colors-solarized' 
"Bundle 'https://github.com/jonathanfilip/vim-lucius'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/scrooloose/nerdcommenter'
Plugin 'https://github.com/jistr/vim-nerdtree-tabs.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
"Bundle 'jelera/vim-javascript-syntax'
Plugin 'https://github.com/nathanaelkane/vim-indent-guides.git'
"Bundle 'https://github.com/kien/rainbow_parentheses.vim'
"!Bundle 'https://github.com/canadaduane/VimKata'
"!Bundle 'https://github.com/Lokaltog/vim-easymotion.git'
"Bundle 'https://github.com/koron/minimap-vim.git' -- doesn't work so well
"Bundle 'maksimr/vim-jsbeautify' -- use autoformat..will use the external tools
"Bundle 'einars/js-beautify'
Plugin 'https://github.com/Chiel92/vim-autoformat.git'
Plugin 'https://github.com/ervandew/supertab.git'
Plugin 'Raimondi/delimitMate'
"Plugin 'jelera/vim-javascript-syntax'
" fork of the jelera one
Plugin 'https://github.com/othree/yajs.vim.git'
Plugin 'Majutsushi/Tagbar'

Plugin 'unblevable/quick-scope' 
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'EdKolev/tmuxline.vim'
Plugin 'vasconcelloslf/vim-interestingwords'

" Optional:
Plugin 'https://github.com/honza/vim-snippets'
 
if s:macmode == "Y"
	" The following require Python
	"Bundle 'https://github.com/vim-scripts/Conque-Shell.git'
	Plugin 'https://github.com/severin-lemaignan/vim-minimap.git'
    Plugin 'https://github.com/tpope/vim-dispatch.git'
    Plugin 'https://github.com/OmniSharp/omnisharp-vim.git'
    "NOTE: run omnisharp-vim/server/xbuild after updates
    Plugin 'https://github.com/tpope/vim-fugitive.git'
	Plugin 'https://github.com/airblade/vim-gitgutter.git'
    "YouCompleteMe Compile Instructions
    "pushd ~/dotfiles/.vim/bundle/YouCompleteMe
    "./install.py --clang-completer --omnisharp-completer
    "popd
    Plugin 'https://github.com/Valloric/YouCompleteMe'
    if has("gui_running")
        #
    else
        Plugin 'christoomey/vim-tmux-navigator'
    endif

    " really slow
    "Plugin 'marijnh/tern_for_vim'

    " YouCompleteMe and UltiSnips compatibility, with the helper of supertab
    " (via http://stackoverflow.com/a/22253548/1626737)
    let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType    = '<C-n>'
    let g:SuperTabCrMapping                = 0

    Plugin 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


    """"""""""""""""""""""""""""
    " Typescript
    """"""""""""""""""""""""""""
    Plugin 'Shougo/vimproc.vim'
    " pushd ~/dotfiles/.vim/bundle/vimproc.vim
    " make
    " popd
    "
    Plugin 'Quramy/tsuquyomi'
    "    Bundle 'clausreinke/typescript-tools.vim'
    Plugin 'leafgarland/typescript-vim'

endif
call vundle#end()            " required

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.




"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" be vImproved
set nocompatible
 
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
set nowrap
 
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=50 columns=200
endif
 

""
"" Wildmode
""
" Turn on the WiLd menu
" Make tab completion for files/buffers act like bash
set wildmenu
 
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.pdb,*/obj/*/*.*,*.suo


" Use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
 
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.vspscc,*.vssscc
 
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
 
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
 
" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
 
" Ignore node modules
set wildignore+=node_modules/*
 
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Ignore unity files
set wildignore+=*.meta,.DS_Store,*/metadata/*/*.*,*/ShaderCache/*/*.*,Temp/*/*.*

" Ignore Atomic files
set wildignore+=*.asset

set complete=.,b,u,]

"Always show current position
set ruler
 
" Height of the command bar
set cmdheight=2
 
" A buffer becomes hidden when it is abandoned
set hid
 
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
 
" Ex Mode style setting
let g:netrw_liststyle=3
 
" Turn on the mouse
set mouse=a

" Turn on spell checking
set spell
 
""
"" Whitespace
""
 
set expandtab     " Tab in insert mode will produce spaces
set tabstop=4     " Width of a tab
set shiftwidth=4  " Width of reindent operations and auto indentation
set softtabstop=4 " Set spaces for tab in insert mode
set autoindent    " Enable auto indentation
 
 
" Invisible characters
"set listchars=tab:▸\ ,nbsp:_
"set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮
"set listchars=tab:▸\ ,trail:·,nbsp:_,extends:❯,precedes:❮
set listchars=tab:▸\ ,trail:·
if has("gui_macvim")
    "set list listchars=tab:➝\ ,trail:·,extends:<,precedes:>
else
    "set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮
endif
 
 
" Don't show invisible characters (default)
set list
 
" Toggle set list
nnoremap <leader>l :set list!<cr>
 
" Always move down and up by display lines instead of real lines
" nnoremap <silent>j gj
" nnoremap <silent>k gk
 
""
"" Joining
""
 
" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j     
endif
 
" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces
 
" Joining with indents is useless - instead join and delete spaces
nnoremap gJ Jdiw

"Map escape key to jk -- much faster
imap jk <esc>




" Folding {{{

set foldmethod=syntax
set foldlevel=99
set foldnestmax=10			" max 10 depth
set nofoldenable			" don't fold files by default on open
set foldlevelstart=1		" start with fold level of 1

" Folding  for C#: http://vim.wikia.com/wiki/Syntax-based_folding, see comment by Ostrygen au FileType cs set omnifunc=syntaxcomplete#Complete
au FileType cs set foldmethod=marker
au FileType cs set foldmarker={,}
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
au FileType cs set foldlevelstart=2 


" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set incsearch
set hlsearch
 
" Turn on line numbers (visual studio extension) 
set number
 
 
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

set background=dark

if (!has('gui_running'))
    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    colorscheme solarized
else
    colorscheme desert
endif

"colorscheme lucius
"LuciusDarkLowContrast
set cursorline
 
" Change the line number color to gray
hi LineNr guifg=#777777
 
 
""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
 
 
""""""""""""""""""""""""""""""
" => Terminal Overrides
""""""""""""""""""""""""""""""
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set autoread
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
 
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" set leader ev to edit vimrc and sv to re-source it
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
 
 
" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>
map <silent> <space> :noh<cr>
 
" Smart way to move between windows
:nnoremap <C-J> <C-W>j
:nnoremap <C-K> <C-W>k
:nnoremap <C-H> <C-W>h
:nnoremap <C-L> <C-W>l

" resize splits
" No worky in tmux
:nnoremap <leader><Left> :vertical resize +5<cr>
:nnoremap <leader><Right> :vertical resize -5<cr>
:nnoremap <leader><Up> :resize +5<cr>
:nnoremap <leader><Down> :resize -5<cr>
 
" Smart way to move between buffers
"map <C-j> :bp<cr>
"map <C-k> :bn<cr>
 
" more natural split
set splitright
set splitbelow
 
" cd to current file
map <leader>cd :cd %:p:h<cr>
 
" Shortcut for copying and pasting from system clipboard
map <leader>p "*p
map <leader>y "*y
map <leader>Y V"*y
 
" map :q to close buffer instead of quit
":cnoreabbrev wq W<bar>bd
":cnoreabbrev qq q!
":cnoreabbrev q bd
 
" map cmd to open a command window at the current location
" (windows only)
:cnoreabbrev cmd :!cd %:p:h&&start /B cmd && exit<cr>
 

" Don't close the window when closing a buffer
" nmap <leader>d :b#<bar>bd#<bar>b<CR>
" nmap <leader>kc :b#<bar>bd#<bar>b<CR>
nmap <silent> <leader>d :bp\|bd #<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Add empty line above ore below
map ZO O<ESC>
map Zo o<ESC>

 " =============================================================================
" Multipurpose Tab Key
" =============================================================================
 
"!" Indent if at the beginning of a line, else do completion
"!function! InsertTabWrapper()
"!  let col = col('.') - 1
"!  if !col || getline('.')[col - 1] !~ '\k'
"!    return "\<tab>"
"!  else
"!    return "\<c-p>"
"!  endif
"!endfunction
"!inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"!inoremap <s-tab> <c-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" =============================================================================
" Filetypes and Custom Autocmds
" =============================================================================
 
augroup vimrcEx
  " Clear all autocmds for the current group
  autocmd!
 
  " Jump to last cursor position unless it's invalid or in an event handler or
  " a git commit
  au BufReadPost *
    \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
 
  " Some file types use real tabs
  au FileType {make,gitconfig} set noexpandtab sw=4

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json setf javascript
 
  " Make Python follow PEP8
  au FileType python set sts=4 ts=4 sw=4 tw=79
 
  " Use 4 spaces for Java
  au FileType java set sts=4 ts=4 sw=4
 
  " Make sure all markdown files have the correct filetype
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
 
  " MultiMarkdown requires 4-space tabs
  au FileType markdown set sts=4 ts=4 sw=4
 
  " Use 4-space tabs for apache
  au FileType apache set sts=4 ts=4 sw=4
 
  " Leave the return key alone when in command line windows, since it's used
  " to run commands there
  au! CmdwinEnter * :unmap <cr>
  au! CmdwinLeave * :call MapCR()
augroup END

""""""""""""""""""""""""""""""
" Custom File Types
""""""""""""""""""""""""""""""
au BufNewfile,BufRead,BufReadPost *.bdy setfiletype plsql
au BufNewfile,BufRead,BufReadPost *.spc setfiletype plsql
au BufNewfile,BufRead,BufReadPost *.mod setfiletype plsql
au BufNewFile,BufRead *.es6 set filetype=javascript

augroup turbobadger
  " Clear all autocmds for the current group
  autocmd!
  au BufNewfile,BufRead,BufReadPost *.tb setfiletype turbobadger
  au FileType turbobadger setlocal noexpandtab sw=4
augroup END

" Change the popup menu colors
:highlight Pmenu guibg=black gui=bold guifg=yellow 

""""""""""""""""""""""""""""""
" => Insert mode snippets
""""""""""""""""""""""""""""""
":inoremap {<space> {}<left><space>
":inoremap {<cr> {}<left><cr><cr><up><tab>
":inoremap {{ {
:inoremap <C-h> <C-o><left>
:inoremap <C-j> <C-o><down>
:inoremap <C-k> <C-o><up>
:inoremap <C-l> <c-o><right>
 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
 
 
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree / ExMode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>n :NERDTreeToggle<cr>
map <leader>n <plug>NERDTreeTabsToggle<cr>
"nnoremap <leader>n :Ex<cr>
 
" Show hidden files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeIgnore = ['\.asset$']

" NERDTree Tabs
let g:nerdtree_tabs_smart_startup_focus=2
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change the font to Source Code Pro Medium from Adobe
"set anti enc=utf-8 gfn=Source_Code_Pro_Medium:h12
"set guifont=Source\ Code\ Pro\ Medium:h12
"let g:Powerline_symbols="fancy"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set encoding=utf-8
if has("gui_macvim")
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12
else
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h9
endif
 
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick Scope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings
 
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)
 
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
 
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

if has("mac") || has("macunix")
    "let g:syntastic_error_symbol = '✘'
    let g:syntastic_error_symbol = 'x'
    let g:syntastic_warning_symbol = "!"
    "let g:syntastic_warning_symbol = "▲"
    "!let g:syntastic_error_symbol = 'âœ˜'
    "!let g:syntastic_warning_symbol = "â–²"
endif

augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
  au FileType javascript let b:syntastic_mode = "passive"
augroup END

map <Leader>ll :SyntasticCheck<cr>

" Lua
let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args" 

let g:syntastic_javascript_checkers = ["eslint"]
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS-Beautify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set path to js-beautify file
"let g:jsbeautify_file = fnameescape(fnamemodify(expand("<sfile>"), ":h")."/bundle/js-beautify/beautify.js")
"map <c-f> :call JsBeautify()<cr>
"let g:jsbeautify = {"indent_size": 4, "indent_char": "\t"}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:formatdef_typescript = '"tsfmt --stdin"'
let g:formatters_typescript = ['typescript']
" map <c-f> :Autoformat<cr><cr>
nnoremap <leader>cf :Autoformat<cr>
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>b :CtrlPBuffer<cr>
map <leader>m :CtrlPMRU<cr>
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'results:25' " overcome limit imposed by max height

" Ctrl-P Funky
map <leader>f :CtrlPFunky<cr>
nnoremap <Leader>u :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_sort_by_mru = 1
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-javascript-syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au FileType javascript call JavaScriptFold()
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-indent-guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_start_level = 2
let g:indent_guides_guide_Size = 1
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Parenthesis
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:rbpt_colorpairs = [
"    \ ['brown',       'RoyalBlue3'],
"    \ ['Darkblue',    'SeaGreen3'],
"    \ ['darkgray',    'DarkOrchid3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'RoyalBlue3'],
"    \ ['darkred',     'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['brown',       'firebrick3'],
"    \ ['gray',        'RoyalBlue3'],
"    \ ['black',       'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['Darkblue',    'firebrick3'],
"    \ ['darkgreen',   'RoyalBlue3'],
"    \ ['darkcyan',    'SeaGreen3'],
"    \ ['darkred',     'DarkOrchid3'],
"    \ ['red',         'firebrick3'],
"    \ ]
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
 
 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniComplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set omnifunc=syntaxcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TERN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tern_map_keys=1
let g:tern_show_argument_hints="on_hold"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniSharp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1
let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

"Super tab settings - uncomment the next 4 lines
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']
augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>cb :wa!<cr>:OmniSharpBuildAsync<cr>

    " automatic syntax check on events (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs cCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    "autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    "remap to f12
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    "autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "remap to S-F12
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    "autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    autocmd FileType cs nnoremap <leader>k :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    "autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
    autocmd FileType cs nnoremap <leader>j :OmniSharpNavigateDown<cr>

    autocmd FileType cs nnoremap <leader>cf :OmniSharpCodeFormat<cr>
augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500

" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <leader>rr :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
nnoremap <F12> :OmniSharpGotoDefinition<cr>
nnoremap <S-F12> :OmniSharpFindUsages<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>


" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" You Complete Me
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't do autocompletion in strings
let g:ycm_complete_in_strings = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" delimitMate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" expand {} with CR correctly
let delimitMate_expand_cr = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TMUX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAGBAR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
