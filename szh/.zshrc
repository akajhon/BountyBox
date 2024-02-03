# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set ZSH theme
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# Disable silly colours for writable directories
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
zstyle ':completion:*' list-colors

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go
export GOROOT=/usr/local/go
export GOPATH=/root/go
export PATH=${GOPATH}/bin:${GOROOT}/bin:${PATH}

# Set docker to use Windows daemon
export DOCKER_HOST=tcp://localhost:2375

# Aliases
ls-alias(){
  echo amass-single
  echo amass-list
  echo dirsearch-report
  echo harvest
  echo masscan-top
  echo masscan-full
  echo massdns-resolve
  echo nmap-tcp-fast
  echo nmap-tcp-full
  echo nmap-udp-fast
  echo nmap-udp-full
  echo subfinder-single
  echo subfinder-list
  echo urlscan
  echo myip
}

myip() {
  dig +short myip.opendns.com @resolver1.opendns.com
}

amass-single() {
  # example: amass-single domain.com
  amass enum -active -v -d $1 | tee amass-single-subdomains-$(date +'%Y')-$(date +'%m')-$(date +'%d').txt
}

amass-list() {
  # usage: amass-list domains.txt
  amass enum -active -v -df $1 | tee amass-list-subdomains-$(date +'%Y')-$(date +'%m')-$(date +'%d').txt
}

dirsearch-report() {
  # usage: dirsearch-report -u https://domain.com -e html,php
  python3 ~/toolkit/dirsearch/dirsearch.py -r --plain-text-report=dirsearch-$(date +'%Y')-$(date +'%m')-$(date +'%d').txt $@
}

harvest(){
  # usage: harvest domain.com
  theHarvester -b all -d $1
}

masscan-top() {
  # usage: masscan-top 20 subdomains.txt
  masscan --top-ports $1 -iL $2 | sort > masscan-top-$1-ports.txt
}

masscan-full() {
  # usage: masscan-full subdomains.txt
  masscan -p0-65535 -iL $1 | sort > masscan-allports.txt
}

massdns-resolve(){
  # usage: massdns subdomains.txt
  massdns -r ~/toolkit/massdns/lists/resolvers.txt -t A -w massdns-raw.txt -q -o S $1
  cat massdns-raw.txt | grep -v CNAME | awk '{split($0,a," "); print a[3]}' | sort | uniq > massdns-resolved-ips.txt
}

nmap-tcp-fast(){
  # usage: nmap-tcp-fast host.domain.com
  nmap --disable-arp-ping -Pn -oA nmap-tcp-fast $1
}

nmap-tcp-full(){
  # usage: nmap-tcp-full host.domain.com
  nmap --disable-arp-ping -Pn -A -p- -sC -oA nmap-tcp-allports $1
}

nmap-udp-fast(){
  # usage: nmap-udp-fast host.domain.com
  nmap --disable-arp-ping -Pn -sU -oA nmap-udp-fast $1
}

nmap-udp-full(){
  # usage: nmap-udp-full host.domain.com
  nmap --disable-arp-ping -Pn -sU -p- -A -oA nmap-udp-allports $1
}

subfinder-single() {
  # usage subfinder-single domain.com
  subfinder -d $1 | tee subfinder-single-$(date +'%Y')-$(date +'%m')-$(date +'%d').txt
}

subfinder-list() {
  # usage subfinder-list domains.txt
  subfinder -dL $1 | tee subfinder-list-$(date +'%Y')-$(date +'%m')-$(date +'%d').txt
}

urlscan() {
  # usage urlscan host.domain.com
  gron "https://urlscan.io/api/v1/search/?q=domain:$1"  | grep 'url' | gron --ungron
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

BOLD=$(tput bold)
NORMAL=$(tput sgr0)
RED='\033[0;31m'
NC='\033[0m'

# Print a welcome message

echo -e '                                                                                 '
echo -e '  ██████╗  ██████╗ ██╗   ██╗███╗   ██╗████████╗██╗   ██╗██████╗  ██████╗ ██╗  ██╗'
echo -e '  ██╔══██╗██╔═══██╗██║   ██║████╗  ██║╚══██╔══╝╚██╗ ██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝'
echo -e '  ██████╔╝██║   ██║██║   ██║██╔██╗ ██║   ██║    ╚████╔╝ ██████╔╝██║   ██║ ╚███╔╝ '
echo -e '  ██╔══██╗██║   ██║██║   ██║██║╚██╗██║   ██║     ╚██╔╝  ██╔══██╗██║   ██║ ██╔██╗ '
echo -e '  ██████╔╝╚██████╔╝╚██████╔╝██║ ╚████║   ██║      ██║   ██████╔╝╚██████╔╝██╔╝ ██╗'
echo -e '  ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝      ╚═╝   ╚═════╝  ╚═════╝ ╚═╝  ╚═╝'
echo -e '               Built and maintained by https://github.com/akajhon                '
echo -e '                     https://github.com/akajhon/BountyBox                        '
echo -e "${BOLD}"
echo -e '                         The BugHunter best friend                               '
echo -e "${NC}"