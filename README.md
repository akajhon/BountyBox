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
docker run --hostname BountyBox -it bountybox
```

### This command will start the container and open a shell session where you can start using the tools.
