<h1 align="center"> BountyBox </h1> 

<h3 align="center">  Welcome to the BountyBox project! </h3> 

This Docker container is designed to equip security researchers, bug bounty hunters, and ethical hackers with a comprehensive set of tools to discover, analyze, and report vulnerabilities. The goal of this project is to streamline the setup process and provide a ready-to-use environment that supports a wide range of security testing and reconnaissance tasks.

***

<h1 align="center"> Getting Started ...</h1> 

## Prerequisites

Docker installed on your machine

## Installation

Clone the repository:

```bash
git clone https://github.com/akajhon/BountyBox.git
```

Change to the `BountyBox` directory:

```bash
cd BountyBox
```

Build the Docker image:

```bash
docker build -t bountybox . 
```

Run the Container:

```bash
docker run --rm -it -v /path/to/local/directory:/results --hostname BountyBox bountybox
```

### This command will start the container and open a shell session where you can start using the tools.


## Inspiration

This project was created with the intention of improving and continuing the development of the projects below, available at:

```bash
https://github.com/KingOfBugbounty/DockerHunt
https://github.com/JakobTheDev/bug-bounty
https://github.com/l34r00t/mainRecon
https://github.com/mcnamee/huntkit
```

## To-DOs
 - [ ] Add Katana
 - [ ] Add Dalfox
 - [ ] Add ArchiveFuzz
 - [ ] Add OpenRedireX
 - [ ] Add Metabigor (export ASSUME_NO_MOVING_GC_UNSAFE_RISK_IT_WITH=go1.21 )
 - [ ] Add prips, aiohttp, tqdm to pip configuration onm dockerfile
 - [ ] Add chromium-browser  - https://github.com/scheib/chromium-latest-linux
