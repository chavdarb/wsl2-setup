# WSL2 Setup Scripts

Automated setup scripts for configuring a fresh WSL2 development environment.

## Overview

This repository contains scripts to quickly set up a complete development environment in WSL2, including:

- **Graphics stack** for WSLg support
- **Multiple Java versions** (8, 11, 17, 21) with a version switcher
- **SDKMAN** with Maven
- **Google Chrome** for GUI browsing
- **JetBrains Toolbox** for IDE management
- **Node Version Manager (nvm)** with LTS Node.js
- **Docker** with Docker Compose
- **AWS CLI v2** with Session Manager Plugin
- **SSH key generation** for GitLab
- **Git configuration**
- **Essential development tools**

## Quick Start

1. Clone this repository using HTTPS (no SSH key required initially):

```bash
git clone https://gitlab.paysafe.cloud/chavdarbaykov/wsl2-setup.git ~/bin
cd ~/bin
```

2. Run the setup script:

```bash
./initial-setup.sh
```

3. Follow the prompts during installation:
   - Enter a passphrase for your SSH key (or press Enter for no passphrase)
   - Copy the displayed SSH public key and add it to your GitLab account
   - Press any key to continue with the rest of the setup

## What Gets Installed

### System Updates & Tools
- Latest system packages via `apt update && apt upgrade`
- Network tools (`net-tools`)
- Essential build tools (`make`, `zip`, `unzip`)
- System utilities (`ntpdate`, `wslu`, `jq`)
- Graphics stack for WSLg (`mesa-vulkan-drivers`, `vulkan-tools`, `mesa-utils`, `glmark2-wayland`)

### Java Development
- OpenJDK 8, 11, 17, and 21
- SDKMAN with Maven
- Java version switcher (`java-switcher.sh`) with commands:
  - `java8`, `java11`, `java17`, `java21` - Switch Java versions
  - `javaVersion` - Display current Java version and path
- Default: Java 21

### Containerization
- Docker CE (Community Edition)
- Docker Compose Plugin
- Docker Buildx Plugin
- User added to docker group (requires logout/login)

### Cloud & AWS
- AWS CLI v2
- AWS Session Manager Plugin (SSM)

### Web & GUI
- Google Chrome (stable)

### Development Tools
- JetBrains Toolbox (for IntelliJ IDEA, PyCharm, etc.)
- Node Version Manager (nvm) with LTS Node.js

### Git & SSH
- Git (latest from git-core PPA)
- Git configured with your email and name
- SSH key generated for GitLab authentication

## Scripts Included

### `initial-setup.sh`
Main setup script that orchestrates all installations and configurations.

### `setup-scripts/`
- **`setup-path.sh`** - PATH management utility
- **`setup-git.sh`** - Git configuration and SSH key generation
- **`setup-aws.sh`** - AWS CLI v2 and Session Manager Plugin installation
- **`setup-chrome.sh`** - Google Chrome installation
- **`setup-docker.sh`** - Docker CE and plugins installation
- **`setup-java.sh`** - Multiple JDK versions installation
- **`setup-jetbrains.sh`** - JetBrains Toolbox installation
- **`setup-nvm.sh`** - Node Version Manager installation
- **`java-switcher.sh`** - Java version management utility

### `java-switcher.sh`
Java version management utility sourced in `.bashrc`:
- Ensures only one JDK is active in PATH at a time
- Provides simple commands to switch between Java versions
- Automatically sets Java 21 on shell startup

## Post-Installation

## Installing JIdea

Install JIdea using the `jetbrains-toolbox` and configure the following `Help->Edit Custom VM Options`

```
   -Dsun.java2d.uiScale=1
   -Dawt.toolkit.name=WLToolkit
   -Dsun.awt.wl.Shadow=false
```

After running the setup:

1. **Add your SSH key to GitLab**: Copy the public key displayed during setup to your GitLab SSH keys settings
2. **Restart your terminal** or run `source ~/.bashrc` to load all environment changes
3. **Launch JetBrains Toolbox**: The app will start automatically during setup
4. **Verify installations**:
   ```bash
   java -version          # Should show Java 21
   mvn -version           # Should show Maven
   node -v                # Should show LTS Node.js
   docker --version       # Should show Docker version
   aws --version          # Should show AWS CLI v2
   python3 -V
   jq --version
   session-manager-plugin # Should show the AWS session manager plugin
   google-chrome --version
   jetbrains-toolbox      # Should start JetBrains Toolbox
   ```

