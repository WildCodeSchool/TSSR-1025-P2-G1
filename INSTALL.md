
## Sommaire

1. [Prérequis technique](#1-prérequis-techniques)
2. [Installation sur le serveur Debian (Debian 12.9)](#2-installation-sur-le-serveur-debian-12-9)
	- [Création d'une paire de clés Debian/Windows11](#22-creation-dune-paire-de-cles-debian-windows)
3. [Installation sur le serveur Windows (Windows serveur 2022)](#3-installation-sur-le-serveur-windows-2022)
4. [Installation sur le client Windows (Windows 11)](#4-installation-sur-le-client-windows-11)
	- [Installation OpenSSH en CLI](#41-installation-openssh-en-cli)
	- [Modification du fichier configuration SSH](#42-modification-du-fichier-configuration-ssh)
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

##### 2.1 Installation de  Open SSH.

Logiquement sur Debian le logiciel **OpenSHH** est installé nativement. Voici la commande pour vérification :

```bash
apt-cache policy openssh-server
```

Voici la Capture d'écran :

 ![image](Ressources/Serveur_Debian/debian_statut_openssh.png)
 
  
Nous pouvons constater que la **OpenSHH** est bien installé et que nous avons la version 10.0.

Si **OpenSSH** n'est pas installé voici la commande :

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install openssh-server
```

Maintenant vérifions l'état du serveur *SSH* :

![image](Ressources/Serveur_Debian/Statut_fonctionnement-openssh_debian.png)

Nous voyons qu'il a le statut *active*

Si cela n'est pas le cas voici la commande pour démarrer le service :

```bash
systemctl start sshd
```

##### 2.2 Création d'une paire de clés Debian---Windows11

Pour générer la paire de clés voici la commande :

```bash
ssh-keygen -t ed25519 -C "wilder@debian-lab"
```

Remplir impérativement la **passphrase** ,cela seras le seul mot de passe à retenir pour toutes vos connexions sur vos serveurs possédant cette clé.

Ensuite nous devons créé sur la machine Windows le dossier **.ssh** :

```bash
ssh wilder@CLIWIN01 "mkdir .ssh"
```

On devra saisir le mot de passe *SSH* de l'utilisateur visé.

Puis on copie la clé *Publique* sur la machine Windows :

```bash
scp ~/.ssh/id_ed25519.pub wilder@CLIWIN01:.ssh/authorized_keys
```



## 3. Installation sur le serveur Windows ( Windows serveur 2022 )

## 4. Installation sur le client Windows ( Windows 11 )
##### 4.1 Installation Open SSH en CLI pour la connexion avec Debian

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

##### 4.2 Modification du fichier de configuration *SSH*

Commencer par ouvrir **PowerShell** en tant qu'administrateur.

Ensuite ce rendre dans le dossier suivant :

```bash
notepad C:\ProgramData\ssh\sshd_config
```

Il faut dé-commenter cette ligne = Enlever le **#** devant pour l'activer

	PubkeyAuthentication yes

Il faut Commenter cette ligne = Ajouter un **#** devant pour la désactiver

	PasswordAuthentication yes

Faire un **CTRL+X** pour sauvegarder le fichier après les modifications

Nous allons copier notre clé publique vers le fichiers des administrateur avec cette commande :

```bash
Copy-Item C:\Users\wilder\.ssh\authorized_keys C:\ProgramData\ssh\administrators_authorized_keys
```

Dernière étape mais très importante nous devons redémarrer le service **sshd** avec cette commande :

```bash
 Restart-Service sshd
```

Ensuite voici la commande pour tester la connexion *SSH* depuis Debian pour se connecter avec la **passphrase** sur windows :

```bash
ssh wilder@CLIWIN01
```

## 5. Installation sur le client Linux ( Ubuntu 24.04 LTS )

## 6. FAQ

