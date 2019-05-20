# Parse git branch
function parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ git:(\1)/'
}

# PS1 variable format 
export PS1="\u:\[\033[34m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] "

#  Commit everything
function commit() {
   commitMessage="$1"

   if [ "$commitMessage" = "" ]; then
      commitMessage="wip"
   fi

   git add .
   eval "git commit -a -m '${commitMessage}'"
}

# MySQL short command crud action 
function db {
   if [ "$1" = "refresh" ]; then
      mysql -uroot -e "drop database $2; create database $2"
   elif [ "$1" = "create" ]; then
      mysql -uroot -e "create database $2"
   elif [ "$1" = "drop" ]; then
      mysql -uroot -e "drop database $2"
   fi
}

# Get current weather
function weather() {
   city="$1"

   if [ -z "$city" ]; then
      city="Bandung"
   fi

   eval "curl http://wttr.in/${city}"
}

# Create archive using zip
function archive() {
   zip -r "$1".zip -i "$1" ;
}

# Convert video to m4v
function converttom4v() {
   input="$1"
   output="${input%.*}"

   if [[ ! -z "$input" ]]; then
      ffmpeg -i "${input}" -acodec copy -vcodec copy "${output}".m4v 
   fi
}

# Create a new directory and enter it
function mkd() {
   mkdir -p "$@" && cd "$@"
}

# PHP
alias a="php artisan"
alias c="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"
alias mfs="php artisan migrate:fresh --seed"
alias nah="git reset --hard;git clean -df'"
alias sshconfig="vi ~/.ssh/config"
alias copykey="command cat ~/.ssh/id_rsa.pub | pbcopy"
alias mysqladm="mysql -u root"

# Git
alias gm="git merge"
alias gb="git branch"
alias gc="git checkout"
alias gpo="git push origin"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gds="find . -name .DS_Store -print0 | xargs -0 git rm --ignore-unmatch"

# Fast open
alias o="open ."

# List all files colorized in long format
alias ..="cd .."
alias l="ls -Glh"
alias ll="ls -Glh"
alias la="ls -Galh"
alias ls="ls -G"

# VSCode
alias code='open -a "/Applications/Visual Studio Code.app" "`pwd`"'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Lock the screen
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Genymobile - Mirror your android device
alias mirrorandroid="scrcpy -b1M -m800"

# Larger bash history (allow 32³ entries; default is 500)
#export HISTSIZE=32768
#export HISTFILESIZE=$HISTSIZE
#export HISTCONTROL=ignoredups
#export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
#export HISTORY_IGNORE="(ls|cd|cd -|pwd|exit|date|* --help)"

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export HOMEBREW_NO_AUTO_UPDATE=1

export PATH="~/.composer/vendor/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/node@10/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

