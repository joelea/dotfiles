# This is the right one to edit

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
PATH="/Users/jlea/tools/trails/bin/unix/":$PATH
PATH="/Libary/Frameworks":$PATH
PATH="/Users/jlea/Libary/Frameworks":$PATH
PATH="/Users/jlea/Library/Haskell/ghc-7.6.3/lib":$PATH
PATH="/Users/jlea/Library/Haskell/bin":$PATH
PATH="/usr/local/bin":$PATH
java8=/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home
java7=/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home
java6=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export JAVA_7_HOME=$java7
export JAVA_8_HOME=$java8
export JAVA_HOME=$java8
GRADLE_HOME="/Users/jlea/bin/gradle-2.0"
export PATH

alias verify='./scripts/verify.sh'

#vim
alias e='vim'

# UNIX general
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias mvf='mv'
alias rmf='rm'
alias cpf='cp'
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias ls='ls -l'
alias ll='ls | more'
alias la='ls -a | more'
alias lh='ls -a .* | more'
alias rmall='rmdir --ignore-fail-on-non-empty'
alias rmd='rmdir'
alias j='jump'
alias json='jq .'
function rest { curl $* | json }
function javaportkill { lsof -i tcp:$1 | grep java | awk '{print $2}' | xargs kill }
set -o vi
export CLICOLOR=1

alias sublime='open -a Sublime\ Text\ 2'

# Private
source ~/.private_profile

# Java
alias jc='javac'
alias je='java'

# Gradle
function gradled {
   gradle $* | tee ~/.gradle.log
}

function gradle {
  if [ -s gradlew ]; then
    ./gradlew $*
  else
    echo "WARNING: You are using a native gradle installation. This build will not be repeatable"
    echo "Put the following in your build.gradle: "
    echo ""
    echo "task wrapper(type: Wrapper) {"
    echo "  gradleVersion = '2.5'"
    echo "}"

    sh /usr/local/bin/gradle $*
  fi
}

alias checkstyle='gradle checkstyle{Main,Test} --continue'

alias artifactory='sh ~/Code/Artifactory/bin/artifactory.sh'

# GIT
alias g='git'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gout='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias feature='git flow feature'
alias f='feature'
alias fuckit='git reset --hard'
alias shitonit='ga . && git reset --hard'

# functions
function mkd {
	mkdir $*
	cd $1
}

function refactor {
  git commit -m 'Refactor: '$1
}

function checkstyle {
  git commit -m 'Checkstyle Fix: '$1
}

# prompt styling
# PS1="[\W] : " # WorkingDirectory $
# export PS1='\[\e[30;47;2m\] \[\e[34;3m\]\W\[\e[31;3m\]$(__git_ps1 " (%s)") \[\e[30;3m\]\[\e[0m\] \$ '

# brew bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
. `brew --prefix`/etc/bash_completion
fi

# generate and read .osxaliases
if [ -x ~/.getosxaliases ]; then
  ~/.getosxaliases
  source ~/.osxaliases
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi
