#!/usr/bin/env bash

# Creating variables
export HOME=/root
export TOOLS="/opt"
export ADDONS="/usr/share/addons"
export CONFIGS="/usr/share/configs"
export WORDLISTS="/usr/share/wordlists"
export GO111MODULE=on
export GOROOT=/usr/local/go
export GOPATH=/go
export PATH=${HOME}/:${GOPATH}/bin:${GOROOT}/bin:${PATH}
export DEBIAN_FRONTEND=noninteractive

#ToolsPath="$HOME/Tools"

echo "Creating all necessary folders"

mkdir $WORDLISTS && mkdir $ADDONS && mkdir $CONFIGS
mkdir -p $TOOLS/.gf
mkdir -p $CONFIGS/notify/
mkdir -p $CONFIGS/amass/
mkdir -p $CONFIGS/subfinder/
mkdir -p $CONFIGS/aquatone/
mkdir -p $CONFIGS/findomain/

# --- Wordlists ---
echo "Downloading Wordlists..."
# seclists
git clone --depth 1 https://github.com/danielmiessler/SecLists.git $WORDLISTS/seclists

#payloadallthethings
git clone --depth 1 https://github.com/swisskyrepo/PayloadsAllTheThings $WORDLISTS/payloadallthethings

# rockyou
curl -L https://github.com/praetorian-code/Hob0Rules/raw/db10d30b0e4295a648b8d1eab059b4d7a567bf0a/wordlists/rockyou.txt.gz \
  -o $WORDLISTS/rockyou.txt.gz && \
  gunzip $WORDLISTS/rockyou.txt.gz

echo "Download some important files"
eval wget -nc -O $WORDLISTS/XSS-OFJAAAH.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XSS/XSS-OFJAAAH.txt
eval wget -nc -O $WORDLISTS/params.txt https://raw.githubusercontent.com/s0md3v/Arjun/master/arjun/db/params.txt
eval wget -nc -O ~/.gf/potential.json https://raw.githubusercontent.com/devanshbatham/ParamSpider/master/gf_profiles/potential.json

# --- Tools ---

echo "Install FFF"
go install github.com/tomnomnom/fff@latest
sleep 1

echo "Install airixss"
go install github.com/ferreiraklet/airixss@latest
sleep 1

echo "Install Freq"
go install github.com/takshal/freq@latest
sleep 1

echo "Install Goop"
go install github.com/deletescape/goop@latest
sleep 1

echo "Install Hakrawler"
go install github.com/hakluke/hakrawler@latest
sleep 1

echo "Install Httprobe"
go install github.com/tomnomnom/httprobe@latest
sleep 1

echo "Install Meg"
go install github.com/tomnomnom/meg@latest
sleep 1

echo "Install Haklistgen"
go install github.com/hakluke/haklistgen@latest
sleep 1

echo "Install Haktldextract"
go install github.com/hakluke/haktldextract@latest
sleep 1

echo "Install Hakcheckurl"
go install github.com/hakluke/hakcheckurl@latest
sleep 1

echo "Install tojson"
go install github.com/tomnomnom/hacks/tojson@latest
sleep 1

echo "Install gowitness"
go install github.com/sensepost/gowitness@latest
sleep 1

echo "Install rush"
go install github.com/shenwei356/rush@latest
sleep 1

echo "install naabu"
go install github.com/projectdiscovery/naabu/cmd/naabu@latest
sleep 1

echo "Install hakcheckurl"
go install github.com/hakluke/hakcheckurl@latest
sleep 1

echo "Install shuffledns"
go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
sleep 1

echo "Install rescope"
go install github.com/root4loot/rescope@latest
sleep 1

echo "Install gron"
go install github.com/tomnomnom/gron@latest
sleep 1

echo "Install html-tool"
go install github.com/tomnomnom/hacks/html-tool@latest
sleep 1

echo "install Chaos"
go install github.com/projectdiscovery/chaos-client/cmd/chaos@latest
sleep 1

echo "Install gf"
go install github.com/tomnomnom/gf@latest
sleep 1

echo "Install qsreplace"
go install github.com/tomnomnom/qsreplace@latest
sleep 1

echo "Install Amass"
go install github.com/OWASP/Amass/v3/...@latest
sleep 1

echo "Install ffuf"
go install github.com/ffuf/ffuf@latest
sleep 1

echo "Install assetfinder"
go install github.com/tomnomnom/assetfinder@latest
sleep 1

echo "Install github-subdomains"
go install github.com/gwen001/github-subdomains@latest
sleep 1

echo "Install cf-check"
go install github.com/dwisiswant0/cf-check@latest
sleep 1

echo "Install waybackurls"
go install github.com/tomnomnom/hacks/waybackurls@latest
sleep 1

echo "Install nuclei"
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
nuclei -update
sleep 1

echo "Install anew"
go install github.com/tomnomnom/anew@latest
sleep 1

echo "Install notify"
go install github.com/projectdiscovery/notify/cmd/notify@latest
sleep 1

echo "Install mildew"
go install github.com/daehee/mildew/cmd/mildew@latest
sleep 1

echo "Install dirdar"
go install github.com/m4dm0e/dirdar@latest
sleep 1

echo "Install unfurl"
go install github.com/tomnomnom/unfurl@latest
sleep 1

echo "Install shuffledns"
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
sleep 1

echo "Install httpx"
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
sleep 1

echo "Install github-endpoints"
go install github.com/gwen001/github-endpoints@latest
sleep 1

echo "Install dnsx"
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
sleep 1

echo "Install subfinder"
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sleep 1

echo "Install gauplus"
go install github.com/bp0lr/gauplus@latest
sleep 1

echo "Install subjs"
go install github.com/lc/subjs@latest
sleep 1

echo "Install subjs"
go install github.com/hiddengearz/jsubfinder@latest
wget https://raw.githubusercontent.com/ThreatUnkown/jsubfinder/master/.jsf_signatures.yaml && mv .jsf_signatures.yaml ~/.jsf_signatures.yaml
sleep 1

echo "Install Gxss"
go install github.com/KathanP19/Gxss@latest
sleep 1

echo "Instal gospider"
go install github.com/jaeles-project/gospider@latest
sleep 1

echo "Install crobat"
go install github.com/cgboal/sonarsearch/crobat@latest
sleep 1

echo "Install dalfox"
go install github.com/hahwul/dalfox/v2@latest
sleep 1

echo "Install puredns"
go install github.com/d3mondev/puredns/v2@latest
sleep 1

echo "Install cariddi"
go install https://github.com/edoardottt/cariddi/@latest
sleep 1

echo "Install interactsh-client"
go install github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
Sleep 1

echo "Install kxss"
go install github.com/tomnomnom/hacks/kxss@latest
sleep 1

echo "Install GetJs"
go install github.com/003random/getJS@latest
sleep 1

echo "Install hakrevdns"
go install github.com/hakluke/hakrevdns@latest
sleep 1

echo "Install Aquatone"
go get github.com/shelld3v/aquatone
ln -s /usr/local/go/aquatone /usr/bin/aquatone
sleep 1

echo "Install dnsgen"
pip3 install dnsgen
sleep 1

echo "Cloning all repos and install"

git clone --depth 1 https://github.com/tomnomnom/gf $TOOLS/gf
cp -r $TOOLS/gf/examples/*.json $TOOLS/.gf

git clone --depth 1 https://github.com/1ndianl33t/Gf-Patterns $TOOLS/Gf-Pattern
mv $TOOLS/Gf-Patterns/*.json $TOOLS/.gf

git clone --depth 1 https://github.com/m4ll0k/SecretFinder $TOOLS/SecretFinder
pip3 install -r $TOOLS/SecretFinder/requirements.txt

git clone --depth 1 https://github.com/m4ll0k/BBTz $TOOLS/BBTz

git clone --depth 1 https://github.com/bonino97/new-zile.git $TOOLS/newzile

git clone --depth 1 https://github.com/devanshbatham/ParamSpider $TOOLS/ParamSpider
pip3 install -r $TOOLS/ParamSpider/requirements.txt

git clone --depth 1 https://github.com/s0md3v/XSStrike.git $TOOLS/xsstrike
pip3 install -r $TOOLS/xsstrike/requirements.txt
chmod a+x $TOOLS/xsstrike/xsstrike.py
ln -sf $TOOLS/xsstrike/xsstrike.py /usr/local/bin/xsstrike

wget --quiet https://github.com/Findomain/Findomain/releases/download/5.1.1/findomain-linux -O $TOOLS/findomain/findomain
chmod +x $TOOLS/findomain/findomain
ln -sf $TOOLS/findomain/findomain /usr/bin/findomain

git clone --depth 1 https://github.com/GerbenJavado/LinkFinder.git $TOOLS/linkfinder
python3 setup.py $TOOLS/linkfinder/install
pip3 install -r $TOOLS/linkfinder/requirements.txt

echo "export PATH=${PATH}" >> ~/.zshrc
chsh -s $(which zsh)