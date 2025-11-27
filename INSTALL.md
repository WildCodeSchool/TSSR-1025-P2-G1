
## Sommaire

1. [Prérequis technique](#1-prérequis-techniques)
2. [Installation sur le serveur Debian (Debian 12.9)](#2-installation-sur-le-serveur-debian-129)
3. [Installation sur le serveur Windows (Windows serveur 2022)](#3-installation-sur-le-serveur-windows-2022)
4. [Installation sur le client Windows (Windows 11)](#4-installation-sur-le-client-windows-11)
5. [Installation sur le client Linux (Ubuntu 24.04 LTS)](#5-installation-sur-le-client-linux-ubuntu-2404-lts)
6. [FAQ](#6-faq)


## 1. Prérequis technique

Nous devons avoir 4 machines Virtuelle sous **PROXMOX** :

- Serveur Debian : 
	Nom : **SRVLX01**
	IP : **172.16.10.10/24**
	
 - Serveur Windows 2022
	Nom : **CLIWIN01**
	IP : **172.16.10.5/24**

- Client Windows 11 :
	Nom : **CLIWIN01**
	IP : **172.16.10.20/24**
		
- Client Linux :
	Nom : **CLILIN01**
	IP : **172.16.10.30/24**

Il faut un compte **ROOT** et **Administrator** sur les 2 serveurs
Il faut un compte utilisateur **wilder** sur les 4 VM
Adresse de **BROADCAST** : **172.16.10.254**
DNS : **8.8.8.8**

## 2. Installation sur le serveur Debian ( Debian 12.9 )

## 3. Installation sur le serveur Windows ( Windows serveur 2022 )

## 4. Installation sur le client Windows ( Windows 11 )
##### 4.1 Installation Open SSH en CLI 

1. Ouvrir PowerShell en mode **administrateur**

```bash
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
```

2. Une fois l'installation terminé, il faut démarré le service :

```bash
Start-Service sshd
```

3. On configure le service pour qu'il démarre automatiquement

```bash
Set-Service -Name sshd -StartupType "Automatic"
```



## 5. Installation sur le client Linux ( Ubuntu 24.04 LTS )

## 6. FAQ

