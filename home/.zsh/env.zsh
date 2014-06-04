if [ -d "/usr/local/bin" ] ; then
    PATH="/usr/local/bin:$PATH"
fi
if [ -d "$HOME/.rbenv/bin" ] ; then
    PATH="$HOME/.rbenv/bin:$PATH"
fi
#eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
if [ -d "/usr/local/heroku/bin" ] ; then
    PATH=/usr/local/heroku/bin:$PATH
fi
export TERM=xterm-256color

# PATH の内容と同期している配列変数 path も使える
path=(~/bin(N-/) ~/homebrew/bin(N-/) $path)

# あるマシンには存在するがマシン固有のPATH を追加したいなら、
# パスの後ろに (N-/) をつけると、ディレクトリが存在しない場合、パスが空文字列に置換される
# 詳細は `man zshexpn` の Glob Qualifiers を参照
