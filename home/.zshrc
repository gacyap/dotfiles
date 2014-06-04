#環境設定
export LANG=ja_JP.UTF-8
case ${UID} in
        0)
            LANG=C
            ;;
esac

# PAGER
export PAGER=lv
#色読み込み 
autoload -Uz colors
colors
# keyBind like emacs
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 2行表示
PROMPT="%{${fg[blue]}%}[%n@%m]%{${reset_color}%} %~ %# "

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# キーバインド
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

########################################
# cdコマンド後にlsを自動実行
function chpwd() { ls -lF }

########################################
# w3mでGoogle検索
function gg() {
local str opt
if [ $ != 0 ]; then
    for i in $*; do
        str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt='search?num=50&hl=ja&lr=lang_ja'
    opt="${opt}&q=${str}"
fi
w3m http://www.google.co.jp/$opt
}

# 1年以内の検索
function ggy() {
local str opt
if [ $ != 0 ]; then
    for i in $*; do
        str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt='search?num=50&hl=ja&lr=lang_ja'
    opt="${opt}&q=${str}"
    tbs='&tbs=qdr:y'
fi
w3m http://www.google.co.jp/$opt$tbs
}

function ch() {
local str opt
if [ $ != 0 ]; then
    for i in $*; do
        str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt='search?num=50&hl=ja&lr=lang_ja'
    opt="${opt}&q=${str}"
fi
open -a Google\ Chrome http://www.google.co.jp/$opt
}

# w3mでALC検索
function alc() {
if [ $ != 0 ]; then
    w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
else
    w3m "http://www.alc.co.jp/"
fi
}
########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*|freebsd*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G'
    ;;
    linux*)
        #Linux用の設定
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
    ;;
esac

source ~/.zsh/env.zsh
source ~/.zsh/option.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/vcs.zsh
# vim:set ft=zsh:
