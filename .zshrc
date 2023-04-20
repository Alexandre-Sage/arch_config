setxkbmap fr 
neofetch
#echo " \x1B[32m__  /   __|  |  | ";
#echo "    /  \__ \  __ | ";
#echo " ____| ____/ _| _| ";
#echo "                   ";



# Prompt
PROMPT="%F{blue}┌[%f%F{cyan}%m%f%F{blue}]─[%f%F{162}%D{%H:%M-%d/%m}%f%F{blue}]─[%f%F{cyan}%d%f%F{blue}]%f"$'\n'"%F{blue}└╼%f%F{162}$USER%f%F{blue} => %f"
autoload -U promptinit

export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH


#nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm



function hex-encode()
{
  echo "$@" | xxd -p
}

function hex-decode()
{
  echo "$@" | xxd -p -r
}

function rot13()
{
  echo "$@" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}
alias ls='ls -lh --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zstyle ':autocomplete:tab:*' insert-unambiguous yes
zstyle ':autocomplete:tab:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 2
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$PATH
export PATH=$PATH:$ANDROID_HOME/tools:$PATH
export PATH=$PATH:$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
#export PATH=/home/ubuntu/bin:$PATH

export JAVA_HOME=/usr/lib/jvm/default 

export DOCKER_HOST=unix:///run/user/1001/docker.sock
export PATH=/home/arch_alex/c++/v8:$PATH
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory
mkdirFile(){
  mkdir -p "$(dirname "$1")" && touch "$1";
}

    
autoload -Uz compinit
compinit
  

echo -en "\e]2;Terminal\a"
preexec () { print -Pn "\e]0;$1 - Terminal\a" }
ADS_PATH=$HOME/adsFiles
ADS_SCRIPTS=$ADS_PATH/adsScripts


alias installAURPackage(){
  mkdir /tmp/AURClone/$1 
  git clone https://aur.archlinux.org/$1.git /tmp/AURClone/$1
  cd /tmp/AURClone/$1
  makepkg -si
}

alias testDocker(){
  if ! sudo docker info > /dev/null 2>&1; 
  then
    sudo  dockerd &> /dev/null &  
  fi
  if test $1 
    then 
   sudo yarn test $1 
  else 
    sudo yarn test 
  fi
}
alias changeMac(){
  sudo ifconfig wlp0s20f3 down 
  sudo macchanger -A wlp0s20f3
  sudo ifconfig wlp0s20f3 up
}




alias fire(){
  firefox &> /dev/null &
}

isPushable(){
  
}


alias cum(){
  if test $1; then 
    codium $1
  else codium . 
  fi
} 

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
