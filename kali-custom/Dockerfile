# Use the official Kali Linux base image
FROM kalilinux/kali-rolling

# Set a non-root user
ARG USERNAME=kaliuser
ARG USER_UID=1001
ARG USER_GID=1001

# Update packages and install required tools (including Nmap)
RUN apt -y update && DEBIAN_FRONTEND=noninteractive apt -y dist-upgrade && apt -y autoremove && apt clean

# Install common and useful tools
RUN apt -y install curl wget vim git net-tools whois netcat-traditional pciutils usbutils nano

# Install useful languages
RUN apt -y install python3-pip golang nodejs npm

# Install Kali Linux "Top 10" metapackage and a few cybersecurity useful tools
RUN DEBIAN_FRONTEND=noninteractive apt -y install kali-tools-top10 exploitdb man-db dirb nikto wpscan uniscan lsof apktool dex2jar ltrace strace binwalk

# Install Tor and proxychains, then configure proxychains with Tor
RUN apt -y install tor proxychains
# COPY config/proxychains.conf /etc/proxychains.conf

# RUN apt update && apt install -y nmap sudo && \
    # groupadd --gid ${USER_GID} ${USERNAME} && \
    # useradd -m -u ${USER_UID} -g ${USER_GID} -s /bin/bash ${USERNAME} && \
    # echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN apt update && apt install -y nmap sudo

# Install ZSH shell with custom settings and set it as default shell
RUN apt -y install zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# COPY config/.zshrc .

# Switch to the new user
# USER ${USERNAME}

# Set the working directory
# WORKDIR /home/${USERNAME}

# Default command (open Bash shell)
# CMD ["/bin/bash"]
# ENTRYPOINT ["/bin/zsh"]
CMD ["/bin/zsh"]
