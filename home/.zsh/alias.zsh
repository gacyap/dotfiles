# エイリアス
alias rl='source ~/.zshrc'
alias rlv='source ~/.vimrc'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias v='vim'
alias end='exit'
alias ll='ls -al'
alias tl='tail -f'
alias vimdiff='vd'

alias ga='git add'
alias gcm='git commit -m'
alias gps='git push'
alias gck='git checkout'

alias gb='git branch -a'
alias gpl='git pull'
alias gpm='git pull origin master'
alias gd='git diff'
alias gdc'git diff --cached'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi
