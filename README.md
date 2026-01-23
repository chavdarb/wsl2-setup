# WSL2 Setup Scripts

Automated setup scripts for configuring a fresh WSL2 development environment.

## Overview

This repository contains scripts to quickly set up a complete development environment in WSL2, including:

- **Graphics stack** for WSLg support
- **Multiple Java versions** (8, 11, 17, 21) with a version switcher
- **Google Chrome** for GUI browsing
- **JetBrains Toolbox** for IDE management
- **Node Version Manager (nvm)** with LTS Node.js
- **SSH key generation** for GitLab
- **Git configuration**
- **Essential development tools**

## Quick Start

1. Clone this repository using HTTPS (no SSH key required initially):

```bash
git clone https://gitlab.paysafe.cloud/chavdarbaykov/wsl2-setup.git ~/bin
cd ~/bin
```

2. Make the setup script executable and run it:

```bash
chmod +x initial-setup.sh
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
- Graphics stack for WSLg (mesa-vulkan-drivers, vulkan-tools, etc.)

### Java Development
- OpenJDK 8, 11, 17, and 21
- Java version switcher (`java-switcher.sh`) with commands:
  - `java8`, `java11`, `java17`, `java21` - Switch Java versions
  - `javaVersion` - Display current Java version and path
- Default: Java 21

### Web & GUI
- Google Chrome (stable)

### Development Tools
- JetBrains Toolbox (for IntelliJ IDEA, PyCharm, etc.)
- Node Version Manager (nvm) with LTS Node.js

### Git & SSH
- Git configured with your email and name
- SSH key generated for GitLab authentication

## Scripts Included

### `initial-setup.sh`
Main setup script that installs and configures everything listed above.

### `java-switcher.sh`
Java version management utility sourced in `.bashrc`:
- Ensures only one JDK is active in PATH at a time
- Provides simple commands to switch between Java versions
- Automatically sets Java 21 on shell startup

## Post-Installation

After running the setup:

1. **Add your SSH key to GitLab**: Copy the public key displayed during setup to your GitLab SSH keys settings
2. **Restart your terminal** or run `source ~/.bashrc` to load all environment changes
3. **Launch JetBrains Toolbox**: The app will start automatically during setup
4. **Verify installations**:
   ```bash
   java -version          # Should show Java 21
   node -v                # Should show LTS Node.js
   google-chrome --version
   ```

## Customization

To customize the setup for your needs, edit `initial-setup.sh` before running it. Common changes:
- Modify the default Java version (change `java21` to `java17`, etc.)
- Adjust the email and name for Git configuration
- Add or remove packages from the installation list

## License

This is a personal development setup repository.
## Suggestions for a good README

Every project is different, so consider which of these sections apply to yours. The sections used in the template are suggestions for most open source projects. Also keep in mind that while a README can be too long and detailed, too long is better than too short. If you think your README is too long, consider utilizing another form of documentation rather than cutting out information.

## Name
Choose a self-explaining name for your project.

## Description
Let people know what your project can do specifically. Provide context and add a link to any reference visitors might be unfamiliar with. A list of Features or a Background subsection can also be added here. If there are alternatives to your project, this is a good place to list differentiating factors.

## Badges
On some READMEs, you may see small images that convey metadata, such as whether or not all the tests are passing for the project. You can use Shields to add some to your README. Many services also have instructions for adding a badge.

## Visuals
Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.

## Installation
Within a particular ecosystem, there may be a common way of installing things, such as using Yarn, NuGet, or Homebrew. However, consider the possibility that whoever is reading your README is a novice and would like more guidance. Listing specific steps helps remove ambiguity and gets people to using your project as quickly as possible. If it only runs in a specific context like a particular programming language version or operating system or has dependencies that have to be installed manually, also add a Requirements subsection.

## Usage
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Support
Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

## Roadmap
If you have ideas for releases in the future, it is a good idea to list them in the README.

## Contributing
State if you are open to contributions and what your requirements are for accepting them.

For people who want to make changes to your project, it's helpful to have some documentation on how to get started. Perhaps there is a script that they should run or some environment variables that they need to set. Make these steps explicit. These instructions could also be useful to your future self.

You can also document commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something. Having instructions for running tests is especially helpful if it requires external setup, such as starting a Selenium server for testing in a browser.

## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.
