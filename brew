#list all installed packages
brew list

#update all packages installed
brew update && brew install `brew outdated`

#add bash completion on -bash_profile(after installed)
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
