"=============================================================================
"  Description: .vimrc�T���v���ݒ�
"     Author: anonymous
"  Last Modified: 0000-00-00 07:03
"    Version: 0.00
"=============================================================================
set nocompatible
scriptencoding cp932
" scriptencoding�ƁA���̃t�@�C���̃G���R�[�f�B���O����v����悤���ӁI
" scriptencoding�́Avim�̓����G���R�[�f�B���O�Ɠ������̂𐄏����܂��B
" ���s�R�[�h�� set fileformat=unix �ɐݒ肷���unix�ł��g���܂��B

" Windows�œ����G���R�[�f�B���O�� cp932�ȊO�ɂ��Ă��āA
" ���ϐ��ɓ��{����܂ޒl��ݒ肵�����ꍇ�� Let ���g�p���܂��B
" Let�� vimrc(�I�[���C�������p�b�P�[�W�̏ꍇ)�� encode.vim �Œ�`����܂��B
" Let $HOGE=$USERPROFILE.'/�ق�'

"----------------------------------------
" ���[�U�[�����^�C���p�X�ݒ�
"----------------------------------------
" Windows, unix�ł�runtimepath�̈Ⴂ���z�����邽�߂̂��́B
" $MY_VIMRUNTIME�̓��[�U�[�����^�C���f�B���N�g���������B
" :echo $MY_VIMRUNTIME�Ŏ��ۂ̃p�X���m�F�ł��܂��B
if isdirectory($HOME . '/.vim')
    let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
    let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
    let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif

" �����^�C���p�X��ʂ��K�v�̂���v���O�C�����g�p����ꍇ�A
" $MY_VIMRUNTIME���g�p����� Windows/Linux�Ő؂蕪����K�v�������Ȃ�܂��B
" ��) vimfiles/qfixapp (Linux�ł�~/.vim/qfixapp)�Ƀ����^�C���p�X��ʂ��ꍇ
" set runtimepath+=$MY_VIMRUNTIME/qfixapp

"----------------------------------------
" �����G���R�[�f�B���O�w��
"----------------------------------------
" �����G���R�[�f�B���O��UTF-8���ƕ����R�[�h�̎����F���ݒ��encode.vim�ōs���B
" �I�[���C�������p�b�P�[�W�̏ꍇ vimrc�Őݒ肳��܂��B
" �G���R�[�f�B���O�w��╶���R�[�h�̎����F���ݒ肪�K�؂ɐݒ肳��Ă���ꍇ�A
" ���s�� encode.vim�Ǎ������̓R�����g�A�E�g���ĉ������B
" silent! source $MY_VIMRUNTIME/pluginjp/encode.vim
" scriptencoding�ƈقȂ�����G���R�[�f�B���O�ɕύX����ꍇ�A
" �ύX��ɂ�scriptencoding���w�肵�Ă����Ɩ�肪�N���ɂ����Ȃ�܂��B
" scriptencoding cp932
set encoding=utf-8

"----------------------------------------
" �V�X�e���ݒ�
"----------------------------------------
" mswin.vim��ǂݍ���
" source $VIMRUNTIME/mswin.vim
" behave mswin

" �t�@�C���̏㏑���̑O�Ƀo�b�N�A�b�v�����/���Ȃ�
" set writebackup���w�肵�Ă��I�v�V���� 'backup' ���I���łȂ�����A
" �o�b�N�A�b�v�͏㏑���ɐ���������ɍ폜�����B
set nowritebackup
" �o�b�N�A�b�v/�X���b�v�t�@�C�����쐬����/���Ȃ�
set nobackup
if version >= 703
    " �ēǍ��Avim�I������p������A���h�D(7.3)
    " set undofile
    " �A���h�D�̕ۑ��ꏊ(7.3)
    " set undodir=.
endif
" set noswapfile
" viminfo���쐬���Ȃ�
" set viminfo=
" �N���b�v�{�[�h�����L
set clipboard+=unnamed
" 8�i���𖳌��ɂ���B<C-a>,<C-x>�ɉe������
set nrformats-=octal
" �L�[�R�[�h��}�b�s���O���ꂽ�L�[�񂪊�������̂�҂���(�~���b)
set timeout timeoutlen=3000 ttimeoutlen=100
" �ҏW���ʔ�ۑ��̃o�b�t�@����A�V�����o�b�t�@���J���Ƃ��Ɍx�����o���Ȃ�
set hidden
" �q�X�g���̕ۑ���
set history=50
" ���{��̍s�̘A�����ɂ͋󔒂���͂��Ȃ�
set formatoptions+=mM
" Visual block���[�h�Ńt���[�J�[�\����L���ɂ���
set virtualedit=block
" �J�[�\���L�[�ōs���^�s���̈ړ��\�ɐݒ�
set whichwrap=b,s,[,],<,>
" �o�b�N�X�y�[�X�ŃC���f���g����s���폜�ł���悤�ɂ���
set backspace=indent,eol,start
" ���⁛�̕����������Ă��J�[�\���ʒu������Ȃ��悤�ɂ���
set ambiwidth=double
" �R�}���h���C���⊮����Ƃ��ɋ������ꂽ���̂��g��
set wildmenu
" �}�E�X��L���ɂ���
if has('mouse')
    set mouse=a
endif
" plugin���g�p�\�ɂ���
filetype plugin indent on

"----------------------------------------
" ����
"----------------------------------------
" �����̎��ɑ啶������������ʂ��Ȃ�
" �������啶���������̗������܂܂�Ă���ꍇ�͑啶������������ʂ���
set ignorecase
set smartcase
" �������Ƀt�@�C���̍Ō�܂ōs������ŏ��ɖ߂�
set wrapscan
" �C���N�������^���T�[�`
set incsearch
" ���������̋����\��
set hlsearch
" w,b�̈ړ��ŔF�����镶��
" set iskeyword=a-z,A-Z,48-57,_,.,-,>
" vimgrep ���f�t�H���g��grep�Ƃ���ꍇinternal
" set grepprg=internal

"----------------------------------------
" �\���ݒ�
"----------------------------------------
" �X�v���b�V��(�N�����̃��b�Z�[�W)��\�����Ȃ�
" set shortmess+=I
" �G���[���̉��ƃr�W���A���x���̗}��(gvim��.gvimrc�Őݒ�)
set noerrorbells
set novisualbell
set visualbell t_vb=
" �}�N�����s���Ȃǂ̉�ʍĕ`����s��Ȃ�
" set lazyredraw
" Windows�Ńf�B���N�g���p�X�̋�؂蕶���\���� / ���g����悤�ɂ���
"set shellslash "vundle���g���Ƃ��G���[
" �s�ԍ��\��
set number
if version >= 703
    " ���΍s�ԍ��\��(7.3)
    " set relativenumber
endif
" ���ʂ̑Ή��\������
set showmatch matchtime=1
" �^�u��ݒ�
" set ts=4 sw=4 sts=4
" �����I�ɃC���f���g����
set autoindent
" C�C���f���g�̐ݒ�
set cinoptions+=:0
" �^�C�g����\��
set title
" �R�}���h���C���̍��� (gvim��gvimrc�Ŏw��)
" set cmdheight=2
set laststatus=2
" �R�}���h���X�e�[�^�X�s�ɕ\��
set showcmd
" ��ʍŌ�̍s���ł������\������
set display=lastline
" Tab�A�s���̔��p�X�y�[�X�𖾎��I�ɕ\������
set list
set listchars=tab:^\ ,trail:~

" �n�C���C�g��L���ɂ���
if &t_Co > 2 || has('gui_running')
    syntax on
endif
" �F�e�[�}�ݒ�
" gvim�̐F�e�[�}��.gvimrc�Ŏw�肷��
" colorscheme mycolor

""""""""""""""""""""""""""""""
" �X�e�[�^�X���C���ɕ����R�[�h���\��
" iconv���g�p�\�̏ꍇ�A�J�[�\����̕����R�[�h���G���R�[�h�ɉ������\���ɂ���FencB()���g�p
""""""""""""""""""""""""""""""
if has('iconv')
    set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
else
    set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
endif

" FencB() : �J�[�\����̕����R�[�h���G���R�[�h�ɉ������\���ɂ���
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
" diff�̐ݒ�
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

" ���o�b�t�@�̍����\��(�ύX�ӏ��̕\��)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" �t�@�C���܂��̓o�b�t�@�ԍ����w�肵�č����\���B#�Ȃ痠�o�b�t�@�Ɣ�r
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
" �p�b�`�R�}���h
set patchexpr=MyPatch()
function! MyPatch()
    call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction

"----------------------------------------
" �m�[�}�����[�h
"----------------------------------------
" �w���v����
nnoremap <F1> K
" ���݊J���Ă���vim�X�N���v�g�t�@�C�������s
nnoremap <F8> :source %<CR>
" �����S�ۑ��I���𖳌���
nnoremap ZZ <Nop>
" �J�[�\����j k �ł͕\���s�ňړ�����B�����s�ړ���<C-n>,<C-p>
" �L�[�{�[�h�}�N���ɂ͕����s�ړ��𐄏�
" h l �͍s���A�s���𒴂��邱�Ƃ��\�ɐݒ�(whichwrap)
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>zv
nnoremap j gj
nnoremap k gk
nnoremap l <Right>zv

"----------------------------------------
" �}�����[�h
"----------------------------------------

"----------------------------------------
" �r�W���A�����[�h
"----------------------------------------

"----------------------------------------
" �R�}���h���[�h
"----------------------------------------

"----------------------------------------
" Vim�X�N���v�g
"----------------------------------------
""""""""""""""""""""""""""""""
" �t�@�C�����J������O��̃J�[�\���ʒu�ֈړ�
" $VIMRUNTIME/vimrc_example.vim
""""""""""""""""""""""""""""""
augroup vimrcEx
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g`\"" | endif
augroup END

""""""""""""""""""""""""""""""
" �}�����[�h���A�X�e�[�^�X���C���̃J���[�ύX
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
"   " ESC�ł����ɔ��f����Ȃ��΍�
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
" �S�p�X�y�[�X��\��
""""""""""""""""""""""""""""""
" �R�����g�ȊO�őS�p�X�y�[�X���w�肵�Ă���̂ŁAscriptencoding�ƁA
" ���̃t�@�C���̃G���R�[�h����v����悤���ӁI
" �����\������Ȃ��ꍇ�A������scriptencoding���w�肷��Ƃ��܂�������������܂��B
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
        autocmd VimEnter,WinEnter * match ZenkakuSpace /�@/
    augroup END
    call ZenkakuSpace()
endif

""""""""""""""""""""""""""""""
" grep,tags�̂��߃J�����g�f�B���N�g�����t�@�C���Ɠ����f�B���N�g���Ɉړ�����
""""""""""""""""""""""""""""""
" if exists('+autochdir')
"   "autochdir������ꍇ�J�����g�f�B���N�g�����ړ�
"   set autochdir
" else
"   "autochdir�����݂��Ȃ����A�J�����g�f�B���N�g�����ړ��������ꍇ
"   au BufEnter * execute ":silent! lcd " . escape(expand("%:p:h"), ' ')
" endif

"----------------------------------------
" �e��v���O�C���ݒ�
"----------------------------------------

"----------------------------------------
" �ꎞ�ݒ�
"----------------------------------------

set shellxquote=

" keymap
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)
nmap + <Plug>(fontzoom-larger)
nmap - <Plug>(fontzoom-smaller)
nmap <C-ScrollWheelUp> <Plug>(fontzoom-larger)
nmap <C-ScrollWheelDown> <Plug>(fontzoom-smaller)
vmap + <Plug>(fontzoom-larger)
vmap - <Plug>(fontzoom-smaller)
vmap <C-ScrollWheelUp> <Plug>(fontzoom-larger)
vmap <C-ScrollWheelDown> <Plug>(fontzoom-smaller)
imap <C-ScrollWheelUp> <Plug>(fontzoom-larger)
imap <C-ScrollWheelDown> <Plug>(fontzoom-smaller)

"for mac-uskbd
if has("macunix") || has('mac') || has('darwin') || has('unix')
    noremap ; :
endif

" create directory automatically
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

"" simplenote
"nnoremap :sn :<C-u>VimpleNote -n<CR>kojopy-mes@hotmail.co.jp<CR>bepjuoltqphkdbuk<CR>
"nnoremap :sl :<C-u>VimpleNote -l<CR>kojopy-mes@hotmail.co.jp<CR>bepjuoltqphkdbuk<CR>

" 
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>

" �I�������e�L�X�g�̈ړ�
vmap <C-j> <Plug>(Textmanip.move_selection_down)
vmap <C-k> <Plug>(Textmanip.move_selection_up)
vmap <C-h> <Plug>(Textmanip.move_selection_left)
vmap <C-l> <Plug>(Textmanip.move_selection_right)

" �s�̕���
vmap <M-d> <Plug>(Textmanip.duplicate_selection_v)
nmap <M-d> <Plug>(Textmanip.duplicate_selection_n)

" tab settings
"set showtabline=2

" Vim-LaTeX
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_AutoFolding = 0
if has("win32") || has("win64")
    let g:Tex_CompileRule_dvi = 'platex -kanji=utf8 -guess-input-enc -synctex=1 -interaction=nonstopmode $*'
    "let g:Tex_CompileRule_dvi = 'uplatex -kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode $*'
    let g:Tex_CompileRule_ps = 'dvips -Ppdf -t a4 -o $*.ps $*.dvi'
    let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
    let g:Tex_BibtexFlavor = 'pbibtex -kanji=utf8'
    "let g:Tex_BibtexFlavor = 'upbibtex'
    let g:Tex_MakeIndexFlavor = 'mendex -U $*.idx'  
    let g:Tex_ViewRule_dvi = 'C:/w32tex/dviout/dviout.exe -1'
    let g:Tex_ViewRule_ps = 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe -reuse-instance'
    let g:Tex_ViewRule_pdf = 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe -reuse-instance -inverse-search "C:\vim73-kaoriya-win32\gvim.exe -n -c \":RemoteOpen +\%l \%f\""'
elseif has("macunix")
    let g:Tex_CompileRule_dvi = '/usr/texbin/platex -kanji=utf8 -guess-input-enc -synctex=1 --interaction=nonstopmode $*'
    "let g:Tex_CompileRule_dvi = '/usr/texbin/uplatex -synctex=1 -interaction=nonstopmode $*'
    let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -t a4 -o $*.ps $*.dvi'
    let g:Tex_CompileRule_pdf = '/usr/texbin/dvipdfmx -p a4 $*.dvi'
    let g:Tex_BibtexFlavor = '/usr/texbin/pbibtex'
    "let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
    let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex $*.idx'
    let g:Tex_UseEditorSettingInDVIViewer = 1
    "let g:Tex_ViewRule_dvi = '/usr/texbin/pxdvi -watchfile 1 -editor "vim --servername vim-latex -n --remote-silent +\%l \%f"'
    let g:Tex_ViewRule_dvi = '/usr/bin/open -a PictPrinter.app'
    "let g:Tex_ViewRule_dvi = '/usr/bin/open -a Mxdvi.app'
    let g:Tex_ViewRule_ps = '/usr/local/bin/gv --watch'
    let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
    "let g:Tex_ViewRule_pdf = '/usr/bin/open -a Skim.app'
    "let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXShop.app'
    "let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXworks.app'
endif
autocmd FileType tex setl tabstop=4 shiftwidth=4 softtabstop=4

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" indent-guides
let g:indent_guides_guide_size=4

" python settings
"autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

" python script execution
function! s:Exec()
    exe "!" . &ft . " %"
    :endfunction
command! Exec call <SID>Exec() 
map <silent> <C-P> :call <SID>Exec()<CR>

nmap <F5> :!python %<CR>
nmap <F12> :!python -m pdb %<CR>

" python completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python set omnifunc=pysmell#Complete

" vundle (must be at the end)
set nocompatible
filetype off

if has("win32") || has("win64")
set rtp+=~/vimfiles/vundle.git/ 
call vundle#rc("~/vimfiles/bundle/")
else
set rtp+=~/.vim/vundle.git/ 
call vundle#rc()
endif

Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/vimplenote-vim'
Bundle 'mattn/webapi-vim'
Bundle 'gerw/vim-latex-suite'
Bundle 'motemen/git-vim'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'Shougo/neocomplcache'
Bundle 'vim-scripts/pythoncomplete'
Bundle 'tyru/caw.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'thinca/vim-quickrun'
Bundle 'osyo-manga/neocomplcache-clang_complete'
Bundle 'thinca/vim-fontzoom'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 't9md/vim-textmanip'
Bundle 'scrooloose/syntastic'

filetype plugin indent on
