export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export TERM=xterm-256color

# PATH の内容と同期している配列変数 path も使える
path=(~/bin(N-/) ~/homebrew/bin(N-/) $path)

# あるマシンには存在するがマシン固有のPATH を追加したいなら、
# パスの後ろに (N-/) をつけると、ディレクトリが存在しない場合、パスが空文字列に置換される
# 詳細は `man zshexpn` の Glob Qualifiers を参照
path=(/machine1/only/bin(N-/) $path)
