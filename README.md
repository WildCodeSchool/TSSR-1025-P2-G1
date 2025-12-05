## Sommaire 

1. [ Introduction](#1-introduction)
2. [ Présentation du projet](#2-présentation-du-projet)
3. [ Membres du groupe par sprint](#3-membres-du-groupe-par-sprint)
4. [ Choix techniques](#4-choix-techniques)
5. [ Difficultés rencontrées](#5-difficultés-rencontrées)
6. [ Solutions trouvées](#6-solutions-trouvées)
7. [ Améliorations possibles](#7-améliorations-possibles)

# 1. Introduction

Le but est de concevoir et développer un outil d'administration centralisée, capable de gérer et de superviser des systèmes s'exécutant sur diverses plateformes.

# 2. Présentation du projet

L'objectif principal est de fournir une interface facilitant l'exécution de tâches via des scripts telles que la configuration, le déploiement de correctifs, la gestion des utilisateurs et la surveillance des performances, réduisant ainsi la complexité opérationnelle et améliorant l'efficacité et la sécurité à travers l'ensemble du parc informatique, depuis des servers Debian et Windows vers des clients Linux et Windows.

# 3. Membres du groupe par sprint

**Sprint 1**

| Membre      | Rôle       | Missions                                                                                                          |
| ----------- | ---------- | ----------------------------------------------------------------------------------------------------------------- |
| Franck        | PO         | Configuration des machines clients ( Ubuntu/Windows 11 ) / Pseudo-code / Renseignements sur la connexion SSH / Squelette INSTALL.md GitHub|
| Nicolas     | SM         | Configuration du server Debian CLI / Pseudo-code / Renseignements sur la journalisation / Squelette README.md Github   |
| Matthias     | Technicien | Configuration du server Windows / Pseudo-code / Renseignements sur l'ergonomie et la navigation dans le script / Squelette USER_GUIDE.md Github|

**Sprint 2**

| Membre      | Rôle       | Missions                                                                                                          |
| ----------- | ---------- | ----------------------------------------------------------------------------------------------------------------- |
| Franck        | SM         | Scripting Bash/ Finalisation de la connexion SSH / Mise à jour INSTALL.md GitHubTest du script Bash et mise en production sur Proxmox|
| Nicolas     | Technicien         | Scripting Bash / Journalisation  / Test sur Proxmox /Mise à jour README.md Github  |
| Matthias     | PO | Scripting Bash / Mise en place et ajustement de l'ergonomie du script / Aide Journalisation / Scripting PowerShell|

**Sprint 3**


**Sprint 4**


# 4. Choix techniques
    
   ## Matériels :

 Plateforme d'hébergement : PROXMOX
   - 4 VM ( 2 serveurs + 2 clients )   

| Machine      | IP      | OS                                                                                                          |
| ----------- | ---------- | ----------------------------------------------------------------------------------------------------------------- |
| CLIWIN01        | 172.16.10.20         | Windows 10/11|
| CLILIN01   | 172.16.10.30         | Ubuntu 24 LTS|
| SRVWIN01    | 172.16.10.5 | Windows Server 2022/2025 GUI|
| SRVLX01   | 172.16.10.10         | Debian 12/13 CLI|

Passerelle par défaut : 172.16.10.254
Masque de sous-réseau : 255.255.255.0
DNS : 8.8.8.8

## Logiciels :  

   - OpenSSH  
   - L'outil keychain



# 5. Difficultés rencontrées 


# 6. Solutions trouvées


# 7. Améliorations possibles


