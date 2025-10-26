# 🚀 Technical Info - Deploying & Testing Creator's Venture Site

## 1. To generate password

```bash
#install apache2-utils if missing (Debian/Ubuntu)
sudo apt update && sudo apt install -y apache2-utils

# generate bcrypt htpasswd line (no file)
htpasswd -nbB admin 'SuperSecretPassword'
```

# 2. WG Easy Ubuntu VM Configuration

```bash
# Note the container should be in host mode for better networking capabilities

# Enable IP forwarding on the host
vi /etc/sysctl.conf
# uncomment or add below props
net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1

# Apply & verify the config change
sudo sysctl -p
sysctl net.ipv4.ip_forward
sysctl net.ipv6.conf.all.forwarding


# Updating IP tables

    # Flush and delete everything -- Optional
        sudo iptables -F
        sudo iptables -X
        sudo iptables -t nat -F
        sudo iptables -t nat -X
        sudo iptables -t mangle -F
        sudo iptables -t mangle -X
        sudo iptables -t raw -F
        sudo iptables -t raw -X

        # Reset policies to ACCEPT (temporarily)
        sudo iptables -P INPUT ACCEPT
        sudo iptables -P FORWARD ACCEPT
        sudo iptables -P OUTPUT ACCEPT

        # Restart Docker to rebuild its required rules
        sudo systemctl restart docker

# View Rules
sudo iptables -L FORWARD -v -n
sudo iptables -t nat -L POSTROUTING -v -n

# Allow traffic between VPN (wg0) and Internet interface (enp0s6)
sudo iptables -A FORWARD -i wg0 -o enp0s6 -j ACCEPT
sudo iptables -A FORWARD -i enp0s6 -o wg0 -m state --state RELATED,ESTABLISHED -j ACCEPT

# Add NAT (for VPN client internet access)
sudo iptables -t nat -A POSTROUTING -s 10.9.9.0/24 -o enp0s6 -j MASQUERADE

# Save & Reload
sudo netfilter-persistent save
sudo netfilter-persistent reload

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