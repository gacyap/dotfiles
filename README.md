dotfiles
============

## dotfiles
This is the base set of config files, or "dotfiles", used on MakerSquare lab machines. This repo is formatted to work correctly with the homesick gem.

### To install these dotfiles on your own machine, just run the following at the console:

```
gem install homesick
homesick clone https://github.com/username/dotfiles.git
homesick symlink dotfiles
```

## Upgrading

To upgrade your dotfiles, simply run the following commands:

```
homesick pull dotfiles
homesick symlink dotfiles
```

If you see an error message like this when you run the above:

```
Cannot pull with rebase: You have unstaged changes.
Please commit or stash them.
```

You'll just need to run the following instead:

```
cd ~/.homesick/repos/dotfiles
git add .
git stash save
homesick pull dotfiles
homesick symlink dotfiles
git stash pop
```

## manage dotfiles by homesick
* http://dotfiles.github.io/
* http://dev.classmethod.jp/etc/github-homesick-dotfiles/
* https://github.com/makersquare/dotfiles
