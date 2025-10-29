# 🚀 Technical Info - Deploying & Testing Dcoker Compose

## 1. To generate password

```bash
#install apache2-utils if missing (Debian/Ubuntu)
sudo apt update && sudo apt install -y apache2-utils

# generate bcrypt htpasswd line (no file)
htpasswd -nbB admin 'SuperSecretPassword'
```
## 2. Ubuntu VM Setup

```bash

# To get current user and group details
id

# Time Zone Setup
tzselect
sudo timedatectl set-timezone Asia/Kolkata


# Update and Upgrade System Packages
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
sudo apt clean

# Install Core Utilities & Build Tools
sudo apt install -y curl wget git unzip zip tar htop net-tools dnsutils lsof

sudo apt install -y software-properties-common apt-transport-https ca-certificates uild-essential pkg-config

sudo apt install -y vim nano tmux tree jq nmap sysstat screen ufw neofetch

# Install Fail2ban (protect from brute-force SSH)
sudo apt install -y fail2ban
sudo systemctl enable --now fail2ban

# Enable UFW 
sudo ufw status
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw status verbose

# To view rules
sudo ufw status numbered

# Rules

# Plex
sudo ufw allow 32400/tcp
# Traefik (HTTP/HTTPS)
sudo ufw allow 80,443/tcp
# WireGuard (vpn port, Web UI, NAT)
sudo ufw allow 51820/udp     
sudo ufw allow 51821/tcp
sudo ufw route allow in on wg0 out on enp0s6 
sudo ufw route allow in on enp0s6 out on wg0
# Qbittorrent
sudo ufw allow 6881/tcp 
sudo ufw allow 6881/udp
# DNSMASQ (DNS Resolution on WireGuard VPN)
sudo ufw allow in on wg0 to any port 53 proto udp 
sudo ufw allow in on wg0 to any port 53 proto tcp
sudo ufw allow out on wg0 to any port 53 proto udp
sudo ufw allow out on wg0 to any port 53 proto tcp
sudo ufw reload

# Enable IP forwarding on the host
vi /etc/sysctl.conf
# uncomment or add below props
net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1

# Save file

sudo vi /etc/ufw/before.rules
# NAT for WireGuard VPN
*nat
:POSTROUTING ACCEPT [0:0]

# Masquerade traffic from WireGuard clients through the main network interface
-A POSTROUTING -s 10.9.9.0/24 -o enp0s6 -j MASQUERADE

COMMIT

# Save file

# Reload firewall
sudo ufw reload

# Apply & verify the config change
sudo sysctl -p
sysctl net.ipv4.ip_forward
sysctl net.ipv6.conf.all.forwarding

# Dcoker Setup 
sudo apt update && sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg lsb-release

sudo apt remove docker docker-engine docker.io containerd runc -y

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl enable --now docker

sudo docker run hello-world

# Run Docker without sudo
sudo usermod -aG docker $USER


# Storage Disk setup for media - optional

lsblk
sudo mkfs.ext4 /dev/sdb
sudo mkdir /mnt/cv-blkvol-01

sudo blkid /dev/sdb
 # OUTPUT: /dev/sdb: UUID="7d414b70-344d-44c7-b6ec-c3156cbea82b" BLOCK_SIZE="4096" TYPE="ext4"

sudo vi /etc/fstab
#Add below and save
UUID=7d414b70-344d-44c7-b6ec-c3156cbea82b  /mnt/cv-blkvol-01  ext4  defaults,nofail  0  2
sudo mount -a
# Change owner and permission so that the containers can write
sudo chown -R 1001:1001 /mnt/cv-blkvol-01/
sudo chmod -R 775 /mnt/cv-blkvol-01

```

---
# 💫 About Me:

I am a **Technical Consultant & Fullstack Development Architect** with **11+ years of experience** delivering enterprise-grade solutions in **banking, finance, and payment systems**. My expertise spans **end-to-end application architecture**, **payment gateway design**, **instant payment platforms**, and **dispute management systems**.  

I hold globally recognized certifications, including **AWS Solutions Architect, CKAD (Kubernetes), HashiCorp Terraform Associate, Oracle Certified Java Professional, IBM Data Science Professional, and PMP**.  

Currently, I am leading the development of **national-scale payment platforms** for the **Central Bank of Oman**, architecting **secure, high-availability systems** that handle **multi-currency transactions** and comply with GCC and global standards. My work involves **cloud-native modernization (AWS, Docker, Kubernetes, Terraform)**, **DevOps CI/CD automation**, and **regulatory compliance** across complex ecosystems.  

I am passionate about:
- **Designing secure, scalable fintech solutions** (Payment Gateways, Instant Payments, Tokenization, PKI/OTP Authentication).  
- **Driving DevOps and Cloud transformation** with **AWS, Docker, Kubernetes, Terraform**.  
- **Mentoring teams** and collaborating on **open-source projects in banking/fintech**.  

💡 My career highlights include:  
- **95% nationwide adoption** of a Java Spring Boot payment gateway across **25+ banks in Oman**.  
- **Tokenization & Digital Wallet Integration** (Apple Pay, Samsung Pay, OEM wallets).  
- **Cloud migration of certification platforms** using AWS, Terraform, Docker, and Kubernetes, cutting deployment times by **40%**.  
- **Industry recognition** via Client Delight Award and speaking engagements at **Google Developer Community** events.  

---

## 🌐 Socials:

[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ram-lin/)

---

# 💻 Tech Stack:

![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white) 
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E) 
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white) 
![Cloudflare](https://img.shields.io/badge/Cloudflare-F38020?style=for-the-badge&logo=Cloudflare&logoColor=white) 
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white) 
![Angular](https://img.shields.io/badge/angular-%23DD0031.svg?style=for-the-badge&logo=angular&logoColor=white) 
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) 
![Hibernate](https://img.shields.io/badge/Hibernate-59666C?style=for-the-badge&logo=Hibernate&logoColor=white) 
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) 
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white) 
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white) 
![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?style=for-the-badge&logo=redis&logoColor=white) 
![ElasticSearch](https://img.shields.io/badge/-ElasticSearch-005571?style=for-the-badge&logo=elasticsearch) 
![Kafka](https://img.shields.io/badge/Kafka-000?style=for-the-badge&logo=apache-kafka&logoColor=white) 
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white) 
![Jira](https://img.shields.io/badge/jira-%230A0FFF.svg?style=for-the-badge&logo=jira&logoColor=white) 
![Confluence](https://img.shields.io/badge/confluence-%23172BF4.svg?style=for-the-badge&logo=confluence&logoColor=white) 
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white) 
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white) 
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)

---

### ✍️ Random Dev Quote

![](https://quotes-github-readme.vercel.app/api?type=horizontal&theme=radical)

---
Regards,  
Ramakrishna Brahma R
[![](https://visitcount.itsvg.in/api?id=ramakrishna-89&icon=0&color=0)](https://visitcount.itsvg.in)