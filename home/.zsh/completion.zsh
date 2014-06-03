# 補完
#if [[ -d $HOME/.zsh/zsh-completions/src ]]; then
    fpath=($HOME/.zsh/zsh-completions/src $fpath)
#fi
#if [[ -d $HOME/.zsh/completion ]]; then
#    fpath=($HOME/.zsh/completion $fpath)
#fi
autoload -Uz compinit
compinit -u

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補をf n で選択できるようにする
zstyle ':completion:*:default' menu select=2

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
