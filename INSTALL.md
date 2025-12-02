
## Sommaire

1. [Prérequis technique](#1-prérequis-techniques)
2. [Installation sur le serveur Debian (Debian 12.9)](#2-installation-sur-le-serveur-debian-12-9)
	- [Installation de Open SSH](#21-installation-de-open-ssh)
	- [Création d'une paire de clés Debian/Windows11](#22-creation-dune-paire-de-cles-debian-windows)
	- [Copie de la clé Publique sur *CLIWIN01*](#23-copie-de-la-clé-publique-sur-cliwin01)
	- [Copie de la clé Publique sur *CLILIN01*](#24-copie-de-la-clé-publique-sur-clinin01)
	- [Installation de keychain](#25-installation-de-keychain)
3. [Installation sur le serveur Windows (Windows serveur 2022)](#3-installation-sur-le-serveur-windows-2022)
	- [Installation OpenSSH-Client en GUI](#32-installation-openssh-client-en-gui)
	- [Création d'une paire de clés Windows-Serveur](#32-creation-dune-paire-de-clés-windows-serveur)
	- [Copie de la clé Publique sur *CLIWIN01*](#33-copie-de-la-clé-publique-sur-cliwin01)
	- [Copie de la clé Publique sur *CLILIN01*](#34-copie-de-la-clé-publique-sur-clilin01)
	- [Installation de keychain](#35-installation-de-keychain)
4. [Installation sur le client Windows (Windows 11)](#4-installation-sur-le-client-windows-11)
	- [Installation OpenSSH en CLI](#41-installation-openssh-en-cli)
	- [Modification du fichier configuration SSH](#42-modification-du-fichier-configuration-ssh)
5. [Installation sur le client Linux (Ubuntu 24.04 LTS)](#5-installation-sur-le-client-linux-ubuntu-2404-lts)
	- [Installation de OpenSSH-server](#21-installation-de-openssh-server)
	- [Configuration du fichier de configuration SSH](#52-configuration-du-fichier-de-configuration)
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

##### 2.1 Installation de  Open SSH-Server.

Logiquement sur Debian le logiciel **OpenSHH** est installé nativement. Voici la commande pour vérification :

```bash
apt-cache policy openssh-server
```

Voici la Capture d'écran :

 ![image](ressources/images/SRVLX01/debian_statut_openssh.png)
 
  
Nous pouvons constater que la **OpenSHH** est bien installé et que nous avons la version 10.0.

Si **OpenSSH** n'est pas installé voici la commande :

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install openssh-server
```

Maintenant vérifions l'état du serveur *SSH*  avec cette commande :

```bash
systemctl status sshd
```


![image](ressources/images/SRVLX01/statut_fonctionnement-openssh_debian.png)

Nous voyons que le statut est bien en mode *active*.

Si cela n'est pas le cas voici la commande pour démarrer le service :

```bash
systemctl start sshd
```

##### 2.2 Création d'une paire de clés Debian

Pour générer la paire de clés voici la commande :

```bash
ssh-keygen -t ed25519 -C "wilder@debian-lab"
```

Remplir impérativement la **passphrase** ,cela seras le seul mot de passe à retenir pour toutes vos connexions sur vos serveurs possédant cette clé.

##### 2.3 Copie de la clé Publique sur *CLIWIN01*.

Au préalable nous devons exécuter les tâches du paragraphe "**4.1 Installation OpenSHH**."

Ensuite nous devons créé sur la machine Windows le dossier **.ssh** :

```bash
ssh wilder@CLIWIN01 "mkdir .ssh"
```

On devra saisir le mot de passe *SSH* de l'utilisateur visé.

Puis on copie la clé *Publique* sur la machine Windows avec cette commande :

```bash
scp ~/.ssh/id_ed25519.pub wilder@CLIWIN01:.ssh/authorized_keys
```

##### 2.4 Copie de la clé Publique sur *CLILIN01*.

Au préalable nous devons exécuter les tâches du paragraphe "**5.1 Installation OpenSHH**."

Ensuite on copie la clé *Publique* sur la machine Linux avec cette commande :

```bash
ssh-copy-id wilder@CLILIN01
```
Nous devrions avoir cette affichage :

![screenshot](ressources/images/SRVLX01/add_copy_keyspub_clilin01.png)

##### 2.5 Installation de keychain


## 3. Installation sur le serveur Windows ( Windows serveur 2022 )

##### 3.1 Installation OpenSSH-Client en GUI.

Dans la barre de recherche en bas de l'écran il nous faut inscrire 

	optional features

![Screenshots](ressources/images/SRVWIN01/optional_features.png)

Si **OpenSSH Client** n'est pas installer cliquer sur **Add a feature** pour procéder à l'installation.

##### 3.2 Création d'une paire de clés Windows-Serveur

Pour générer la paire de clés voici la commande :

```bash
ssh-keygen -t ed25519 -C "wilder@srvwin_lab"
```
![Screenshots](ressources/images/SRVWIN01/creation_keys_srvwin01.png)
Remplir impérativement la **passphrase** ,cela seras le seul mot de passe à retenir pour toutes vos connexions sur vos serveurs possédant cette clé.

##### 3.3 Copie de la clé Publique sur *CLIWIN01*



##### 3.4 Copie de la clé Publique sur *CLILIN01*


##### 3.5 Installation de keychain


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

Nous devons également ajouter les lignes suivantes pour améliorer la sécurité :

		PermitRootlogin no
		AllowUSers wilder
		
Faire un **CTRL+S** pour sauvegarder le fichier après les modifications

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

il me reste la sécurité des fichiers .ssh dans windows en graphique

## 5. Installation sur le client Linux ( Ubuntu 24.04 LTS )

##### 5.1 Installation de OpenSSH-server.

Nous devons exécuter les commandes suivantes pour l'installation :

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install openssh-server -y
sudo systemctl start ssh 
sudo systemctl enable ssh
```
Ensuite contrôlons le statut du service avec cette commande :

```bash
sudo systemctl status ssh
```
Nous devrions avoir l'affichage suivant : 

![screnshoot](ressources/images/CLILIN01/statut_ssh_clilin01.png)

##### 5.2 Configuration du fichier de configuration SSH.

Exécutons cette commande pour nous rendre dans le fichier de configuration :

```bash
sudo nano /etc/ssh/sshd_config
```
Dans ce fichier nous devons ajouter les lignes suivantes pour améliorer la sécurité :

		PermitRootlogin no
		AllowUSers wilder

Il faut dé-commenter cette ligne = Enlever le **#** devant pour l'activer

		PubkeyAuthentication yes
		PasswordAutentication no

Faire un **CTRL+O** puis **ENTRER** pour sauvegarder et **CTRL+X** pour sortir du fichier après les modifications.	

Dernière étape mais très importante nous devons redémarrer le service **ssh** avec cette commande :

```bash
sudo systemctl restart ssh
```
Ensuite voici la commande pour tester la connexion *SSH* depuis Debian pour se connecter avec la **passphrase** sur CLILIN01 :

```bash
ssh wilder@CLILIN01
```
Nous devrions avoir cette affichage :

![Screnshoot](ressources/images/SRVLX01/connexion_ssh_keys_clilin01.png)

Maintenant nous allons exécuter ses deux commandes pour sécurisés l’accès a notre clé *Publique* :

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/autorized_keys
```
Nous pouvons vérifié les droits avec cette commande :

```bash
ls -la ~/.ssh
```
Nous devrions avoir cette affichage :

![Screenshots](ressources/images/SRVLIN01/permissions_files_ssh_clilin01.png)


## 6. FAQ

