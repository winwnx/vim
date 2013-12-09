"********************************************
"  _vimrc/_gvimrc for cygwin or *nix
"  BY andy wu
"********************************************

"
" echo "loading _vimrc ... "
"

" 加载插件管理器vim-pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

"
" 不同中文编码显示
" 同时支持GBK和UTF-8编码
"
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,chinese,cp936,latin-1
set fileencoding=utf-8
set encoding=utf-8 "set encoding=utf-8
set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"
" 设置字体
" Sample:
" abcdefghijklmnopqrstuvwxyz
" 1234567890
"
"set guifont=Lucida_Console:h9:cANSI
"set guifont=Consolas:h12
"set guifont=Courier_New:h12:cANSI
"set guifont=YaHei\ Consolas\ Hybrid:h12
set guifont=DejaVu\ Sans\ Mono:h11
"set guifont=Microsoft\ YaHei\ Mono:h11

"
" 启动最大化, 设置颜色方案
"
" winsize 1024 768
" au GUIEnter * simalt ~x
colorscheme desert

"
"自动缩进
"
set autoindent

"
" 设置tab制表符为4个空格
"
set ts=4
set expandtab
set shiftwidth=4
set cinoptions=>4,e0,n0,f0,{0,}0,^0,:s,=s,l0,gs,hs,ps,ts,+s,c3,C0,(2s,us,
                          \U0,w0,m0,j0,)20,*30
"
" 展开显示文件类型菜单
"
"let do_syntax_sel_menu = 1 | runtime! synmenu.vim | aunmenu &Syntax.&Show\ filetypes\ in\ menu

"
" 设置语法
"
"if &filetype != 'javacc'
"    setlocal filetype=javacc
"endif
"set syntax=javacc
"cal SetSyn("cpp")
"cal SetSyn("vb")
"cal SetSyn("perl")
"cal SetSyn("awk")

"
" 备份文件放在指定目录
"
set backupdir=d:\temp

"
" 没有警告音和视觉警告
"
set vb t_vb=

"
" 禁用swf交换文件
"
setlocal noswapfile

"
" 显示行号
"
set number

"
" 隐藏工具条
"
" see :help 'guioptions'
"
set guioptions-=T
"set guioptions-=m

"
" 状态条，显示字节数，列数，行数，当前行等信息
"
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line

"
"auto-comments for // and /* */
"setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
"
"disable auto-comments for //
"setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f://
"
"disable auto-comments for // and /* */
"
"setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*
setlocal comments=""

" only for test

" 按键映射
nmap ly 0"*yy
nmap lp "*p

" 搜索选项
set ignorecase
set smartcase
set incsearch

" Powerline setting {
" let g:Powerline_symbols = 'fancy'
" }

" neocompletecache setting begin {
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" } // neocomplcache setting end

" set popup menu color
hi Pmenu                    guibg=#606060
hi PmenuSel                 guifg=#dddd00 guibg=#1f82cd
hi PmenuSbar                guibg=#d6d6d6
hi PmenuThumb               guifg=#3cac3c
