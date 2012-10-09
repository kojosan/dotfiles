### ~/.zshrc
# PATH
export PATH=~/bin:/opt/local/bin:$PATH
export MANPATH=~/man:/opt/local/man:$MANPATH
export PYTHONPATH=~/lib/python:$PYTHONPATH

# Vi風キーバインド
bindkey -v

# ディレクトリ移動
## ディレクトリ名だけでcdする。
setopt auto_cd
## cdで移動してもpushdと同じようにディレクトリスタックに追加する。
setopt auto_pushd
## カレントディレクトリ中に指定されたディレクトリが見つからなかった場合に
## 移動先を検索するリスト。
cdpath=(~)
## ディレクトリが変わったらディレクトリスタックを表示。
chpwd_functions=($chpwd_functions dirs)

# ヒストリ
## ヒストリを保存するファイル
HISTFILE=~/.zsh_history
## メモリ上のヒストリ数。
## 大きな数を指定してすべてのヒストリを保存するようにしている。
HISTSIZE=10000000
## 保存するヒストリ数
SAVEHIST=$HISTSIZE
## ヒストリファイルにコマンドラインだけではなく実行時刻と実行時間も保存する。
setopt extended_history
## 同じコマンドラインを連続で実行した場合はヒストリに登録しない。
setopt hist_ignore_dups
## スペースで始まるコマンドラインはヒストリに追加しない。
setopt hist_ignore_space
## すぐにヒストリファイルに追記する。
setopt inc_append_history
## zshプロセス間でヒストリを共有する。
setopt share_history
## C-sでのヒストリ検索が潰されてしまうため、出力停止・開始用にC-s/C-qを使わない。
setopt no_flow_control

# 補完
## 初期化
autoload -U compinit
compinit

## 補完方法毎にグループ化する。
### 補完方法の表示方法
###   %B...%b: 「...」を太字にする。
###   %d: 補完方法のラベル
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''

## 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。
###           ただし、補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

## 補完候補に色を付ける。
### "": 空文字列はデフォルト値を使うという意味。
zstyle ':completion:*:default' list-colors ""

## 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

## 補完方法の設定。指定した順番に実行する。
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
zstyle ':completion:*' completer \
    _oldlist _complete _match _ignored _approximate _prefix

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
## 詳細な情報を使う。
zstyle ':completion:*' verbose yes
## sudo時にはsudo用のパスも使う。
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"

## カーソル位置で補完する。
setopt complete_in_word
## globを展開しないで候補の一覧から補完する。
setopt glob_complete
## 補完時にヒストリを自動的に展開する。
setopt hist_expand
## 補完候補がないときなどにビープ音を鳴らさない。
setopt no_beep
## 辞書順ではなく数字順に並べる。
setopt numeric_glob_sort

# 実行時間
## 実行したプロセスの消費時間が3秒以上かかったら
## 自動的に消費時間の統計情報を表示する。
REPORTTIME=3

# ログイン・ログアウト
## 全てのユーザのログイン・ログアウトを監視する。
watch="all"
## ログイン時にはすぐに表示する。
log

## ^Dでログアウトしないようにする。
setopt ignore_eof

# ウィンドウタイトル
## 実行中のコマンドとユーザ名とホスト名とカレントディレクトリを表示。
update_title() {
    local command_line=
    typeset -a command_line
    command_line=${(z)2}
    local command=
    if [ ${(t)command_line} = "array-local" ]; then
        command="$command_line[1]"
    else
        command="$2"
fi
    print -n -P "\e]2;"
    echo -n "(${command})"
    print -n -P " %n@%m:%~\a"
}

# GNU coreutils 用エイリアス
alias base64=gbase64
alias basename=gbasename
alias cat=gcat
alias chgrp=gchgrp
alias chmod=gchmod
alias chown=gchown
alias chroot=gchroot
alias cksum=gcksum
alias comm=gcomm
alias cp=gcp
alias csplit=gcsplit
alias cut=gcut
alias date=gdate
alias dd=gdd
alias df=gdf
alias dir=gdir
alias dircolors=gdircolors
alias dirname=gdirname
alias du=gdu
alias echo=gecho
alias env=genv
alias expand=gexpand
alias expr=gexpr
alias factor=gfactor
alias false=gfalse
alias fmt=gfmt
alias fold=gfold
alias groups=ggroups
alias head=ghead
alias hostid=ghostid
alias hostname=ghostname
alias id=gid
alias install=ginstall
alias join=gjoin
alias kill=gkill
alias link=glink
alias ln=gln
alias logname=glogname
alias ls='gls -F'
alias md5sum=gmd5sum
alias mkdir=gmkdir
alias mkfifo=gmkfifo
alias mknod=gmknod
alias mv=gmv
alias nice=gnice
alias nl=gnl
alias nohup=gnohup
alias od=god
alias paste=gpaste
alias pathchk=gpathchk
alias pinky=gpinky
alias pr=gpr
alias printenv=gprintenv
alias printf=gprintf
alias ptx=gptx
alias pwd=gpwd
alias readlink=greadlink
alias rm=grm
alias rmdir=grmdir
alias seq=gseq
alias sha1sum=gsha1sum
alias sha224sum=gsha224sum
alias sha256sum=gsha256sum
alias sha384sum=gsha384sum
alias sha512sum=gsha512sum
alias shred=gshred
alias shuf=gshuf
alias sleep=gsleep
alias sort=gsort
alias split=gsplit
alias stat=gstat
alias stty=gstty
alias su=gsu
alias sum=gsum
alias sync=gsync
alias tac=gtac
alias tail=gtail
alias tee=gtee
alias test=gtest
alias touch=gtouch
alias tr=gtr
alias true=gtrue
alias tsort=gtsort
alias tty=gtty
alias uname=guname
alias unexpand=gunexpand
alias uniq=guniq
alias unlink=gunlink
alias uptime=guptime
alias users=gusers
alias vdir=gvdir
alias wc=gwc
alias who=gwho
alias whoami=gwhoami
alias yes=gyeson

# プロンプト
autoload colors
colors
PROMPT="
%{${fg[blue]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

# タイトルバー
case "${TERM}" in
kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${PWD}\007"
    }
    ;;
esac
