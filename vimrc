"=============================================================================
"  Description: .vimrc
"  Author: kojo
"  Version: 0.00
"=============================================================================
set nocompatible
scriptencoding utf-8

"----------------------------------------
" vimfilesのpath
"----------------------------------------
if isdirectory($HOME.'/.vim')
    let $VIMFILES = $HOME.'/.vim'
elseif isdirectory($HOME.'\vimfiles')
    let $VIMFILES = $HOME.'\vimfiles'
elseif isdirectory($VIM.'\vimfiles')
    let $VIMFILES = $VIM.'\vimfiles'
endif

"----------------------------------------
" エンコーディング指定
"----------------------------------------
" vimの内部エンコーディング指定
set encoding=utf-8
" 既存ファイルを開くためのエンコーディング指定（先頭ほど優先順位高）
set fileencodings=utf-8,cp932,sjis,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213
" 新規ファイルのエンコーディング指定
set fileencoding=utf-8

"----------------------------------------
" システム設定
"----------------------------------------
" ファイルの上書きの前にバックアップを作る/作らない
" set writebackupを指定してもオプション 'backup' がオンでない限り、
" バックアップは上書きに成功した後に削除される。
set nowritebackup
" バックアップ/スワップファイルを作成する/しない
set nobackup
if version >= 703
    " 再読込、vim終了後も継続するアンドゥ(7.3)
    " set undofile
    " アンドゥの保存場所(7.3)
    " set undodir=.
endif
" set noswapfile
" viminfoを作成しない
" set viminfo=
" クリップボードを共有
set clipboard=unnamed,autoselect
" 8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=100
" 編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden
" ヒストリの保存数
set history=50
" 日本語の行の連結時には空白を入力しない
set formatoptions+=mM
" Visual blockモードでフリーカーソルを有効にする
set virtualedit=block
" カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" □や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
" コマンドライン補完するときに強化されたものを使う
set wildmenu
" マウスを有効にする
if has('mouse')
    set mouse=a
endif
" pluginを使用可能にする
filetype plugin indent on

"----------------------------------------
" 検索
"----------------------------------------
" 検索の時に大文字小文字を区別しない
" ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
" インクリメンタルサーチ
set incsearch
" 検索文字の強調表示
set hlsearch
" w,bの移動で認識する文字
" set iskeyword=a-z,A-Z,48-57,_,.,-,>
" vimgrep をデフォルトのgrepとする場合internal
" set grepprg=internal

"----------------------------------------
" 表示設定
"----------------------------------------
" スプラッシュ(起動時のメッセージ)を表示しない
" set shortmess+=I
" エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set noerrorbells
set novisualbell
set visualbell t_vb=
" マクロ実行中などの画面再描画を行わない
" set lazyredraw
" Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
"set shellslash "vundleを使うときエラー
" 行番号表示
set number
if version >= 703
    " 相対行番号表示(7.3)
    " set relativenumber
endif
" 括弧の対応表示時間
set showmatch matchtime=1
" タブを設定
" set ts=4 sw=4 sts=4
" 自動的にインデントする
set autoindent
" Cインデントの設定
set cinoptions+=:0
" タイトルを表示
set title
" コマンドラインの高さ (gvimはgvimrcで指定)
" set cmdheight=2
set laststatus=2
" コマンドをステータス行に表示
set showcmd
" 画面最後の行をできる限り表示する
set display=lastline
" Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~
" ルーラー（右下に表示される行・列の番号）を表示する
set ruler
" シェルに渡すコマンドを囲む引用符
set shellxquote=

""""""""""""""""""""""""""""""
" 印刷設定
""""""""""""""""""""""""""""""
set printoptions=wrap:y,number:y
" set printfont=Monaco:h7
set printheader=%t%=%N
set printencoding=utf-8
" set printmbcharset=JIS_X_1990

set printmbfont=
" 普通文字のフォント
set printmbfont+=r:Osaka-Mono:h7
" 太字 (bold) のフォント
set printmbfont+=,b:Osaka-Mono
" 斜体文字 (italic) のフォント。未設定時はrフラグを使用する。
set printmbfont+=,r:Osaka-Mono
" 太字斜体文字 (bold-italic) のフォント。未設定時はbフラグを使用する。
set printmbfont+=,o:Osaka-Mono

""""""""""""""""""""""""""""""
" ステータスラインに文字コード等表示
" iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
""""""""""""""""""""""""""""""
if has('iconv')
    set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=[0x%{FencB()}]\ [wc:%{WordCount()}]\ (%v,%l)/%L%8P\ 
else
    set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ [wc:%{WordCount()}]\ (%v,%l)/%L%8P\ 
endif
" set updatetime=500

" FencB() : カーソル上の文字コードをエンコードに応じた表示にする
function! FencB()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    let c = iconv(c, &enc, &fenc)
    return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
    return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
    return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

"----------------------------------------
" diff/patch
"----------------------------------------
" diffの設定
if has('win32') || has('win64')
    set diffexpr=MyDiff()
    function! MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let cmd = '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
        silent execute cmd
    endfunction
endif

" 現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
" パッチコマンド
set patchexpr=MyPatch()
function! MyPatch()
    call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction

"----------------------------------------
" ノーマルモード
"----------------------------------------
" ヘルプ検索
nnoremap <F1> K
" 現在開いているvimスクリプトファイルを実行
nnoremap <F8> :source %<CR>
" 強制全保存終了を無効化
nnoremap ZZ <Nop>
" カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
" キーボードマクロには物理行移動を推奨
" h l は行末、行頭を超えることが可能に設定(whichwrap)
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>zv
nnoremap j gj
nnoremap k gk
nnoremap l <Right>zv

" ウインドウ移動を簡単に
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 検索後、画面の中心に
nmap n nzz
nmap N Nzz

"----------------------------------------
" 挿入モード
"----------------------------------------

"----------------------------------------
" ビジュアルモード
"----------------------------------------

"----------------------------------------
" コマンドモード
"----------------------------------------

"----------------------------------------
" Vimスクリプト
"----------------------------------------


""""""""""""""""""""""""""""""
" ファイルを開いたら前回のカーソル位置へ移動
" $VIMRUNTIME/vimrc_example.vim
""""""""""""""""""""""""""""""
augroup vimrcEx
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g`\"" | endif
augroup END

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインのカラー変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
    augroup InsertHook
        autocmd!
        autocmd InsertEnter * call s:StatusLine('Enter')
        autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif
" if has('unix') && !has('gui_running')
"   " ESCですぐに反映されない対策
"   inoremap <silent> <ESC> <ESC>
" endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
    if a:mode == 'Enter'
        silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
    else
        highlight clear StatusLine
        silent exec s:slhlcmd
        redraw
    endif
endfunction

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
    return hl
endfunction

""""""""""""""""""""""""""""""
" 全角スペースを表示
""""""""""""""""""""""""""""""
" コメント以外で全角スペースを指定しているので、scriptencodingと、
" このファイルのエンコードが一致するよう注意！
" 強調表示されない場合、ここでscriptencodingを指定するとうまくいく事があります。
" scriptencoding cp932
function! ZenkakuSpace()
    silent! let hi = s:GetHighlight('ZenkakuSpace')
    if hi =~ 'E411' || hi =~ 'cleared$'
        highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
    endif
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme     * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

""""""""""""""""""""""""""""""
" grep,tagsのためカレントディレクトリをファイルと同じディレクトリに移動する
""""""""""""""""""""""""""""""
" if exists('+autochdir')
"   "autochdirがある場合カレントディレクトリを移動
"   set autochdir
" else
"   "autochdirが存在しないが、カレントディレクトリを移動したい場合
"   au BufEnter * execute ":silent! lcd " . escape(expand("%:p:h"), ' ')
" endif

""""""""""""""""""""""""""""""
"for mac-uskbd
""""""""""""""""""""""""""""""
if has("macunix") || has('mac') || has('darwin') || has('unix')
    noremap ; :
endif

""""""""""""""""""""""""""""""
" create directory automatically
""""""""""""""""""""""""""""""
augroup vimrc-auto-mkdir
    autocmd!
    autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
    function! s:auto_mkdir(dir, force)
        if !isdirectory(a:dir) && (a:force ||
                    \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
            call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
        endif
    endfunction
augroup END

""""""""""""""""""""""""""""""
" 括弧を入力後に括弧内へ移動
""""""""""""""""""""""""""""""
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>

""""""""""""""""""""""""""""""
" 文字数をカウント
""""""""""""""""""""""""""""""
augroup WordCount
  autocmd!
  autocmd BufWinEnter,InsertLeave,CursorHold * call WordCount('char')
augroup END

let s:WordCountStr = ''
let s:WordCountDict = {'word': 2, 'char': 3, 'byte': 4}
function! WordCount(...)
  if a:0 == 0
    return s:WordCountStr
  endif
  let cidx = 3
  silent! let cidx = s:WordCountDict[a:1]

  let s:WordCountStr = ''
  let s:saved_status = v:statusmsg
  exec "silent normal! g\<c-g>"
  if v:statusmsg !~ '^--'
    let str = ''
    silent! let str = split(v:statusmsg, ';')[cidx]
    let cur = str2nr(matchstr(str, '\d\+'))
    let end = str2nr(matchstr(str, '\d\+\s*$'))
    if a:1 == 'char'
      " ここで(改行コード数*改行コードサイズ)を'g<C-g>'の文字数から引く
      let cr = &ff == 'dos' ? 2 : 1
      let cur -= cr * (line('.') - 1)
      let end -= cr * line('$')
    endif
    let s:WordCountStr = printf('%d/%d', cur, end)
  endif
  let v:statusmsg = s:saved_status
  return s:WordCountStr
endfunction

"----------------------------------------
" 各種プラグイン設定
"----------------------------------------

"---plugins---
set nocompatible
filetype off
set rtp+=$VIMFILES/neobundle.vim
call neobundle#rc()
NeoBundle 'Align'
NeoBundle 'Rip-Rip/clang_complete.git'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'gerw/vim-latex-suite'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'kana/vim-textobj-function.git'
NeoBundle 'kana/vim-textobj-indent.git'
NeoBundle 'kana/vim-textobj-syntax.git'
NeoBundle 'mitechie/pyflakes-pathogen'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'operator-replace'
NeoBundle 'operator-user'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'taglist.vim'
NeoBundle 'sequence'
NeoBundle 'textobj-user'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-textobj-plugins.git'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'vim-scripts/pythoncomplete'
NeoBundle 'vim-scripts/Trinity'
NeoBundle 'wesleyche/SrcExpl'
NeoBundle 'https://bitbucket.org/abudden/taghighlight'
NeoBundle 'h1mesuke/textobj-wiw'
NeoBundle 'renamer.vim'
NeoBundle 'SingleCompile'
" NeoBundle 'csv.vim'
" NeoBundle 'c.vim'
filetype plugin indent on

"---sequence---
vmap <m-a> <plug>SequenceV_Increment
vmap <m-x> <plug>SequenceV_Decrement
nmap <m-a> <plug>SequenceN_Increment
nmap <m-x> <plug>SequenceN_Decrement
vmap <c-a> <plug>SequenceAdd
vmap <c-x> <plug>SequenceSubtract

"---operator-replace---
nmap R <Plug>(operator-replace)

"---memolist---
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
let g:memolist_path = "$HOME/Dropbox/memo"

"---quickrun---
" markdown
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
        \ 'exec': ['cat %s|nkf -s|kramdown > memo.html', 'open memo.html'],
        \ 'outputter': 'null'
        \ }

"---Unite.vim---
" 縦分割で開く
let g:unite_enable_split_vertically = 1
let g:unite_winwidth = 80
" " バッファ一覧
" nmap <C-u>b :Unite buffer<CR>
" " PWDのファイル一覧
" nmap <C-u>f :UniteWithBufferDir -buffer-name=file file<CR>
" " 最近使用したファイル一覧
" nmap <C-u>m :Unite file_mru<CR>
" " レジスタ一覧
" nmap <C-u>r :Unite -buffer-name=register register<CR>
" ファイルとバッファ一覧
nmap <Leader>u :Unite buffer file file_mru<CR>

"---syntastic---
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
nmap <Leader>e :Errors<CR><C-w>j

"---NERDTree---
nmap <Leader>n :NERDTreeToggle<CR>

"---taglist---
nmap <Leader>t :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1

"---Source Explorer---
nmap <Leader>s :SrcExplToggle<CR>
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_isUpdateTags = 1

"---Trinity---
" Open and close all the three plugins on the same time
nmap <F7>   :TrinityToggleAll<CR>
" Open and close the srcexpl.vim separately
nmap <F8>   :TrinityToggleSourceExplorer<CR>
" Open and close the taglist.vim separately
nmap <F9>  :TrinityToggleTagList<CR>
" Open and close the NERD_tree.vim separately
nmap <F10>  :TrinityToggleNERDTree<CR>

"---caw (comment out)---
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)

"---neocomplcache & neosnippet---
" disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" neocomplcache で表示される補完の数を増やす
let g:neocomplcache_max_list=1000
" Enable omni completion. Not required if they are already set elsewhere in .vimrc
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" " Enable heavy omni completion, which require computational power and may stall the vim. 
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
" let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

let g:neosnippet#snippets_directory='$VIMFILES/snippets'

" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" For snippet_complete marker.
" if has('conceal')
"   set conceallevel=2 concealcursor=i
" endif



"---clang_complete---
"neocomplcache 側の設定
let g:neocomplcache_force_overwrite_completefunc = 1
if !exists("g:neocomplcache_force_omni_patterns")
    let g:neocomplcache_force_omni_patterns = {}
endif
" omnifunc が呼び出される場合の正規表現パターンを設定しておく
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|::'
" clang_complete 側の設定
" clang_complete の自動呼び出しは必ず切っておいて下さい
let g:clang_complete_auto=0
" libclang を使用して高速に補完を行う
let g:clang_use_library=1
let g:clang_library_path='/opt/local/libexec/llvm-3.3/lib/'
" clang snippets
let g:clang_snippets=1
" clang のコマンドオプション
let g:clang_user_options =
    \ "-I ~/include/ " .
    \ "-I /opt/local/include/ ".
    \ "-I /usr/local/include/ " .
    \ "-I /usr/include/ " .
    \ '-fms-extensions -fgnu-runtime '.
    \ '-include malloc.h '

"---indent-guides---
nmap <Leader>i :IndentGuidesToggle<CR>
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"---GNU global---
" 検索ウインドウを閉じる
nnoremap <C-q> <C-w><C-w><C-w>q
" grepする
nnoremap <C-g>g :Gtags -g 
" カーソル下の定義を探す
nnoremap <C-g>c :Gtags <C-r><C-w><CR>
" カーソル下が参照されている場所を探す
nnoremap <C-g>r :Gtags -r <C-r><C-w><CR>
" 次/前の検索結果
" nnoremap <C-n> :cn<CR>
" nnoremap <C-p> :cp<CR>

"---solarized---
syntax enable

set background=dark
set t_Co=256
let g:solarized_termcolors=16
let g:solarized_italic=0    "default value is 1
let g:solarized_visibility="high"    "default value is normal
colorscheme solarized

"----------------------------------------
" 一時設定
"----------------------------------------


"---Tex settings---
autocmd FileType tex setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 imdisable
autocmd BufNewFile *.tex 0r $VIMFILES/templates/template.tex
" Vim-LaTeX
" ':TTarget dvi' or ':TTarget pdf' でターゲット変更
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_FormatDependency_eps = 'dvi,eps'
let g:Tex_AutoFolding = 0
if has("win32") || has("win64")
    let g:Tex_CompileRule_dvi = 'platex -kanji=utf8 -guess-input-enc -synctex=1 -interaction=nonstopmode $*'
    let g:Tex_CompileRule_ps = 'dvips -Ppdf -t a4 -o $*.ps $*.dvi'
    let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
    let g:Tex_BibtexFlavor = 'pbibtex -kanji=utf8'
    let g:Tex_MakeIndexFlavor = 'mendex -U $*.idx'  
    let g:Tex_ViewRule_dvi = 'C:/w32tex/dviout/dviout.exe -1'
    let g:Tex_ViewRule_ps = 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe -reuse-instance'
    let g:Tex_ViewRule_pdf = 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe -reuse-instance -inverse-search "C:\vim73-kaoriya-win32\gvim.exe -n -c \":RemoteOpen +\%l \%f\""'
elseif has("macunix")
    let g:Tex_CompileRule_dvi = '/usr/texbin/platex -kanji=utf8 -guess-input-enc -synctex=1 --interaction=nonstopmode $*'
    let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -t a4 -o $*.ps $*.dvi'
    let g:Tex_CompileRule_pdf = '/usr/texbin/dvipdfmx -p a4 $*.dvi'
    let g:Tex_CompileRule_eps = '/usr/texbin/dvips -E -Ppdf -x 5000 -o $*.eps $*.dvi'
    let g:Tex_BibtexFlavor = '/usr/texbin/pbibtex'
    let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex $*.idx'
    let g:Tex_UseEditorSettingInDVIViewer = 1
    let g:Tex_ViewRule_dvi = '/usr/bin/open -a PictPrinter.app'
    let g:Tex_ViewRule_ps = '/usr/local/bin/gv --watch'
    let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
endif

"---C/C++ settings---
autocmd FileType c,cpp,cs,cuda setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 nowrap
autocmd BufNewFile *.cpp 0r $VIMFILES/templates/template.cpp
autocmd FileType c,cpp set path+=src,~/include,/opt/local/include,/usr/local/include,/usr/include


"---Python settings---
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile *.py 0r $VIMFILES/templates/template.py

" python script execution
function! s:Exec()
    exe "!" . &ft . " %"
    :endfunction
command! Exec call <SID>Exec() 
map <silent> <Leader>p :call <SID>Exec()<CR>
" nmap <F5> :!python %<CR>
" nmap <F12> :!python -m pdb %<CR>

" python completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python set omnifunc=pysmell#Complete

"---shell script settings---
autocmd BufNewFile *.sh 0r $VIMFILES/templates/template.sh

"---shell script settings---
autocmd FileType markdown,md setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" read local vimrc file
if exists($HOME.".vimrc_local")
    source $HOME/.vimrc_local
endif
