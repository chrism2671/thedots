" VUNDLE
" filetype off
" " set the runtime path to include Vundle and initialize
" set rtp+=~/.config/nvim/bundle/Vundle.vim
" call vundle#begin('~/.config/nvim/bundle')

" " let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'flazz/vim-colorschemes'
" Plugin 'slashmili/alchemist.vim'
" " Plugin 'maksimr/vim-jsbeautify'
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
" Plugin 'Yggdroot/indentLine'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'https://github.com/tpope/vim-fugitive.git'
" Plugin 'leshill/vim-json'
" Plugin 'w0rp/ale'
" Plugin 'tpope/vim-commentary'
" Plugin 'tpope/vim-surround'

" " All of your Plugins must be added before the following line
" call vundle#end()
" filetype plugin indent on  " allows auto-indenting depending on file type
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase

"VUNDLE END
"VIMPLUG
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'VundleVim/Vundle.vim'
Plug 'flazz/vim-colorschemes'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'habamax/vim-elixir-mix-test' 
" Plug 'maksimr/vim-jsbeautify'
Plug 'mhinz/vim-mix-format'
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'leshill/vim-json'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'simnalamburt/vim-mundo'  
Plug 'numkil/ag.nvim'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/wesQ3/vim-windowswap'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" For async completion
Plug 'Shougo/deoplete.nvim'
" For Denite features
Plug 'Shougo/denite.nvim'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'elixir-editors/vim-elixir'


" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Initialize plugin system
call plug#end()
"VIMPLUG END

noremap <c-f> :Files<CR>
noremap <c-n> :NERDTreeToggle<CR>
noremap <Leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <buffer> <leader>tt <Plug>(MixTestRun)
colorscheme molokai_dark
autocmd FileType javascript set formatprg=prettier\ --stdin
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

let g:deoplete#enable_at_startup = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

set ts=2
set sts=2
set et     "expand tabs to spaces

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
