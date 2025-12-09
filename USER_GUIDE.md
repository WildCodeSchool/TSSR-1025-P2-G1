# Sommaire

1. [Introduction](#1-introduction)
2. [Pré-requis d’utilisation](#2-pre-requis-dutilisation)
   - [Script Bash](#21-script-bash)
   - [Script PowerShell](#22-script-powershell)
3. [Lancer le script](#3-lancer-le-script)
   - [Sous Linux](#31-sous-linux)
   - [Sous Windows](#32-sous-windows)
4. [Navigation dans les menus](#4-navigation-dans-les-menus)
   - [Menu principal](#41-menu-principal)
   - [Sélection de la cible](#42-sélection-de-la-cible)
   - [Sélection des actions](#43-sélection-des-actions)
   - [Retour / Quitter](#44-retour--quitter)
5. [Fonctionnalités — Utilisateurs](#5-fonctionnalités--utilisateurs)
   - [Actions possibles](#51-actions-possibles)
   - [Informations récupérables](#52-informations-récupérables)
6. [Fonctionnalités — Machines clientes](#6-fonctionnalites--machines-clientes)
   - [Actions possibles](#61-actions-possibles)
   - [Informations récupérables](#62-informations-récupérables)
7. [Enregistrement des informations](#7-enregistrement-des-informations)
   - [Format des fichiers](#71-format-des-fichiers)
   - [Emplacement](#72-emplacement)
8. [Journalisation (Logs)](#8-journalisation-logs)
   - [Format des fichiers](#81-format-des-fichiers)
   - [Emplacement](#82-emplacement)
9. [FAQ](#9-faq)
10. [Quitter le script](#10-quitter-le-script)

# 1. Introduction

Ce document explique comment utiliser le script d’administration développé dans le cadre du Projet 2 TSSR.
Il est destiné aux utilisateurs finaux souhaitant exécuter les actions d’administration ou récupérer des informations sur les machines du réseau.

Les instructions couvrent :

- l’exécution du script Bash (serveur Debian),
- l’exécution du script PowerShell (serveur Windows),
- la navigation dans les menus,
- l’utilisation des fonctions disponibles.

---

# 2. Pré-requis d’utilisation
## 2.1. Script Bash

Le script Bash doit être exécuté depuis le serveur Debian.<br>
Il nécessite une connexion SSH fonctionnelle vers les machines clientes et la présence des scripts enfants dans le dossier du projet. <br>
Aucun prérequis supplémentaire n'est nécessaire côté utilisateur.

## 2.2. Script PowerShell

---

# 3. Lancer le script
## 3.1. Sous Linux
1. Ouvrir un terminal sur le serveur Debian.
2. Se rendre dans le dossier où se trouve le script :
   `cd ~/Documents/TSSR-1025-P2-G1/ressources/scripts`
3. Lancer le script :
   `./script_dady.sh`
4. Le menu principal s’affiche automatiquement.

## 3.2. Sous Windows

---

# 4. Navigation dans les menus
## 4.1. Menu principal
Le menu principal permet de choisir si l’on veut administrer un utilisateur ou un ordinateur. <br>
Chaque choix ouvre un sous-menu dédié aux actions possibles.

## 4.2. Sélection de la cible
Lorsqu'une action nécessite une machine ou un utilisateur, le script demande d’entrer le nom de la cible. Le nom doit correspondre à un utilisateur ou un poste existant dans votre réseau (ex : wilder, CLILIN01).

## 4.3. Sélection des actions
Chaque menu propose une liste d’actions disponibles. <br>
Il suffit de taper le numéro correspondant à l’action souhaitée. <br>
Le script exécute automatiquement la commande et revient ensuite au sous-menu.

## 4.4. Retour / Quitter
À tout moment, un choix permet de revenir au menu précédent. <br>
L’option “Quitter” ferme proprement le script et enregistre l’événement dans les logs.


---

# 5. Fonctionnalités — Utilisateurs
## 5.1. Actions possibles
Selon les scripts disponibles, il est possible d’effectuer par exemple :
- gérer l’existence d’un utilisateur,
- modifier des paramètres de compte,
- réaliser des actions d’administration ciblées.

## 5.2. Informations récupérables
Le script permet de consulter des informations liées à un utilisateur, comme 
son dernier login ou des éléments de configuration selon les scripts fournis.


---

# 6. Fonctionnalités — Machines clientes
## 6.1. Actions possibles
Les actions disponibles dépendent des scripts enfants fournis. <br>
Elles peuvent inclure par exemple des opérations système ou réseau.

## 6.2. Informations récupérables
Le script peut récupérer des informations système telles que : 
- l’adresse IP de la machine,
- la version de l’OS,
- l’utilisation du CPU,
- l’espace disque.


---

# 7. Enregistrement des informations
## 7.1. Format des fichiers
Les informations récupérées sont enregistrées dans un fichier texte nommé :<br>
`info_<cible>_<date>.txt`

## 7.2. Emplacement
Les fichiers sont rapatriés automatiquement sur le serveur dans :<br>
`~/Documents/TSSR-1025-P2-G1/ressources/scripts/info`


----

# 8. Journalisation (logs)
## 8.1. Format des fichiers
Chaque action effectuée par le script est enregistrée dans le fichier de log. <br>
Le format comprend la date, l’heure, l’utilisateur et l’action réalisée.<br>
Les informations récupérées sont enregistrées dans un fichier log nommé :<br>
`log_evt.log`

## 8.2. Emplacement
Le fichier de log se trouve dans :<br>
`/var/log/log_evt.log`


---

# 9. FAQ

Q : Le script ne trouve pas ma machine.<br>
R : Vérifiez le nom saisi et que la machine est bien accessible en SSH.

Q : Aucun fichier d’informations n’apparaît.<br>
R : Vérifiez que les scripts enfants ont bien été exécutés.

Q : Comment revenir en arrière ?<br>
R : Utilisez le choix dédié dans chaque menu.


---

# 10. Quitter le script

Pour quitter le script, sélectionnez l’option “Quitter” dans le menu principal. <br>
Le script se termine proprement et enregistre l’événement dans les logs.


---
