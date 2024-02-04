#!/usr/bin/env bash

# Creating variables
export HOME=/root
export TOOLS="/opt"
export ADDONS="/usr/share/addons"
export CONFIGS="/usr/share/configs"
export RESULTS="/root/results"
export WORDLISTS="/usr/share/wordlists"
export GO111MODULE=on
export GOROOT=/usr/local/go
export GOPATH=/go
export PATH=${HOME}/:${GOPATH}/bin:${GOROOT}/bin:${PATH}
export DEBIAN_FRONTEND=noninteractive

#ToolsPath="$HOME/Tools"

echo -e "\033[32m [!] Creating all necessary folders [!]\033[0m"
mkdir -p $TOOLS/.gf
mkdir -p $CONFIGS/notify/
mkdir -p $CONFIGS/amass/
mkdir -p $CONFIGS/subfinder/
mkdir -p $CONFIGS/findomain/

# --- Wordlists ---
echo -e "\033[32m [!] Downloading Wordlists... [!]\033[0m"
# seclists
git clone --depth 1 https://github.com/danielmiessler/SecLists.git $WORDLISTS/seclists

#payloadallthethings
git clone --depth 1 https://github.com/swisskyrepo/PayloadsAllTheThings $WORDLISTS/payloadallthethings

# rockyou
curl -L https://github.com/praetorian-code/Hob0Rules/raw/db10d30b0e4295a648b8d1eab059b4d7a567bf0a/wordlists/rockyou.txt.gz \
  -o $WORDLISTS/rockyou.txt.gz && \
  gunzip $WORDLISTS/rockyou.txt.gz

echo -e "\033[32m [!] Download some important files [!]\033[0m"
eval wget -nc -O $WORDLISTS/XSS-OFJAAAH.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XSS/XSS-OFJAAAH.txt
eval wget -nc -O $WORDLISTS/params.txt https://raw.githubusercontent.com/s0md3v/Arjun/master/arjun/db/large.txt

# --- Tools --

echo -e "\033[32m [!] Install FFF [!]\033[0m"
go install github.com/tomnomnom/fff@latest
sleep 1

echo -e "\033[32m [!] Install airixss [!]\033[0m"
go install github.com/ferreiraklet/airixss@latest
sleep 1

echo -e "\033[32m [!] Install Freq [!]\033[0m"
go install github.com/takshal/freq@latest
sleep 1

echo -e "\033[32m [!] Install Goop [!]\033[0m"
go install github.com/deletescape/goop@latest
sleep 1

echo -e "\033[32m [!] Install Hakrawler [!]\033[0m"
go install github.com/hakluke/hakrawler@latest
sleep 1

echo -e "\033[32m [!] Install Httprobe [!]\033[0m"
go install github.com/tomnomnom/httprobe@latest
sleep 1

echo -e "\033[32m [!] Install Meg [!]\033[0m"
go install github.com/tomnomnom/meg@latest
sleep 1

echo -e "\033[32m [!] Install Haklistgen [!]\033[0m"
go install github.com/hakluke/haklistgen@latest
sleep 1

echo -e "\033[32m [!] Install Haktldextract [!]\033[0m"
go install github.com/hakluke/haktldextract@latest
sleep 1

echo -e "\033[32m [!] Install Hakcheckurl [!]\033[0m"
go install github.com/hakluke/hakcheckurl@latest
sleep 1

echo -e "\033[32m [!] Install tojson [!]\033[0m"
go install github.com/tomnomnom/hacks/tojson@latest
sleep 1

echo -e "\033[32m [!] Install gowitness [!]\033[0m"
go install github.com/sensepost/gowitness@latest
sleep 1

echo -e "\033[32m [!] Install rush [!]\033[0m"
go install github.com/shenwei356/rush@latest
sleep 1

echo -e "\033[32m [!] install naabu [!]\033[0m"
go install github.com/projectdiscovery/naabu/cmd/naabu@latest
sleep 1

echo -e "\033[32m [!] Install hakcheckurl [!]\033[0m"
go install github.com/hakluke/hakcheckurl@latest
sleep 1

echo -e "\033[32m [!] Install shuffledns [!]\033[0m"
go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
sleep 1

echo -e "\033[32m [!] Install rescope [!]\033[0m"
go install github.com/root4loot/rescope@latest
sleep 1

echo -e "\033[32m [!] Install gron [!]\033[0m"
go install github.com/tomnomnom/gron@latest
sleep 1

echo -e "\033[32m [!] Install html-tool [!]\033[0m"
go install github.com/tomnomnom/hacks/html-tool@latest
sleep 1

echo -e "\033[32m [!] install Chaos [!]\033[0m"
go install github.com/projectdiscovery/chaos-client/cmd/chaos@latest
sleep 1

echo -e "\033[32m [!] Install gf [!]\033[0m"
go install github.com/tomnomnom/gf@latest
sleep 1

echo -e "\033[32m [!] Install qsreplace [!]\033[0m"
go install github.com/tomnomnom/qsreplace@latest
sleep 1

echo -e "\033[32m [!] Install Amass [!]\033[0m"
go install github.com/OWASP/Amass/v3/...@latest
sleep 1

echo -e "\033[32m [!] Install ffuf [!]\033[0m"
go install github.com/ffuf/ffuf@latest
sleep 1

echo -e "\033[32m [!] Install assetfinder [!]\033[0m"
go install github.com/tomnomnom/assetfinder@latest
sleep 1

echo -e "\033[32m [!] Install github-subdomains [!]\033[0m"
go install github.com/gwen001/github-subdomains@latest
sleep 1

echo -e "\033[32m [!] Install cf-check [!]\033[0m"
go install github.com/dwisiswant0/cf-check@latest
sleep 1

echo -e "\033[32m [!] Install waybackurls [!]\033[0m"
go install github.com/tomnomnom/hacks/waybackurls@latest
sleep 1

echo -e "\033[32m [!] Install nuclei [!]\033[0m"
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
nuclei -update
sleep 1

echo -e "\033[32m [!] Install anew [!]\033[0m"
go install github.com/tomnomnom/anew@latest
sleep 1

echo -e "\033[32m [!] Install notify [!]\033[0m"
go install github.com/projectdiscovery/notify/cmd/notify@latest
sleep 1

echo -e "\033[32m [!] Install mildew [!]\033[0m"
go install github.com/daehee/mildew/cmd/mildew@latest
sleep 1

echo -e "\033[32m [!] Install dirdar [!]\033[0m"
go install github.com/m4dm0e/dirdar@latest
sleep 1

echo -e "\033[32m [!] Install unfurl [!]\033[0m"
go install github.com/tomnomnom/unfurl@latest
sleep 1

echo -e "\033[32m [!] Install shuffledns [!]\033[0m"
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
sleep 1

echo -e "\033[32m [!] Install httpx [!]\033[0m"
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
sleep 1

echo -e "\033[32m [!] Install github-endpoints [!]\033[0m"
go install github.com/gwen001/github-endpoints@latest
sleep 1

echo -e "\033[32m [!] Install dnsx [!]\033[0m"
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
sleep 1

echo -e "\033[32m [!] Install subfinder [!]\033[0m"
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sleep 1

echo -e "\033[32m [!] Install gauplus [!]\033[0m"
go install github.com/bp0lr/gauplus@latest
sleep 1

echo -e "\033[32m [!] Install subjs [!]\033[0m"
go install github.com/lc/subjs@latest
sleep 1

echo -e "\033[32m [!] Install subjs [!]\033[0m"
go install github.com/hiddengearz/jsubfinder@latest
wget https://raw.githubusercontent.com/ThreatUnkown/jsubfinder/master/.jsf_signatures.yaml && mv .jsf_signatures.yaml ~/.jsf_signatures.yaml
sleep 1

echo -e "\033[32m [!] Install Gxss [!]\033[0m"
go install github.com/KathanP19/Gxss@latest
sleep 1

echo -e "\033[32m [!] Instal gospider [!]\033[0m"
go install github.com/jaeles-project/gospider@latest
sleep 1

echo -e "\033[32m [!] Install crobat [!]\033[0m"
go install github.com/cgboal/sonarsearch/crobat@latest
sleep 1

echo -e "\033[32m [!] Install dalfox [!]\033[0m"
go install github.com/hahwul/dalfox/v2@latest
sleep 1

echo -e "\033[32m [!] Install puredns [!]\033[0m"
go install github.com/d3mondev/puredns/v2@latest
sleep 1

echo -e "\033[32m [!] Install cariddi [!]\033[0m"
go install github.com/edoardottt/cariddi/@latest
sleep 1

echo -e "\033[32m [!] Install interactsh-client [!]\033[0m"
go install github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
sleep 1

echo -e "\033[32m [!] Install kxss [!]\033[0m"
go install github.com/tomnomnom/hacks/kxss@latest
sleep 1

echo -e "\033[32m [!] Install GetJs [!]\033[0m"
go install github.com/003random/getJS@latest
sleep 1

echo -e "\033[32m [!] Install hakrevdns [!]\033[0m"
go install github.com/hakluke/hakrevdns@latest
sleep 1

echo -e "\033[32m [!] Install dnsgen [!]\033[0m"
pip3 install dnsgen
sleep 1

echo -e "\033[32m [!] Cloning all repos and install [!]\033[0m"

git clone --depth 1 https://github.com/tomnomnom/gf $TOOLS/gf
cp -r $TOOLS/gf/examples/*.json $TOOLS/.gf

git clone --depth 1 https://github.com/1ndianl33t/Gf-Patterns $TOOLS/Gf-Pattern
mv $TOOLS/Gf-Patterns/*.json $TOOLS/.gf

git clone --depth 1 https://github.com/m4ll0k/SecretFinder $TOOLS/SecretFinder
pip3 install -r $TOOLS/SecretFinder/requirements.txt
ln -sf $TOOLS/SecretFinder/SecretFinder.py /usr/bin/secretfinder

git clone --depth 1 https://github.com/m4ll0k/BBTz $TOOLS/BBTz

git clone --depth 1 https://github.com/bonino97/new-zile.git $TOOLS/newzile

git clone --depth 1 https://github.com/devanshbatham/ParamSpider $TOOLS/ParamSpider
python3 $TOOLS/ParamSpider/setup.py install

git clone --depth 1 https://github.com/s0md3v/XSStrike.git $TOOLS/xsstrike
pip3 install -r $TOOLS/xsstrike/requirements.txt
chmod a+x $TOOLS/xsstrike/xsstrike.py
ln -sf $TOOLS/xsstrike/xsstrike.py /usr/local/bin/xsstrike

mkdir $TOOLS/findomain
wget --quiet https://github.com/Findomain/Findomain/releases/download/5.1.1/findomain-linux -O $TOOLS/findomain/findomain
chmod +x $TOOLS/findomain/findomain
ln -sf $TOOLS/findomain/findomain /usr/bin/findomain

git clone --depth 1 https://github.com/GerbenJavado/LinkFinder.git $TOOLS/linkfinder
python3 $TOOLS/linkfinder/setup.py install
pip3 install -r $TOOLS/linkfinder/requirements.txt
ln -sf $TOOLS/linkfinder/linkfinder.py /usr/bin/linkfinder

echo "export PATH=${PATH}" >> ~/.zshrc
chsh -s $(which zsh)
