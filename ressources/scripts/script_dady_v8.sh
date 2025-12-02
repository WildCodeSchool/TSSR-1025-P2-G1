#!/bin/bash

#########################################################################
# Script Dady V.8
# script must be executed with "sudo"
# Chicaud Matthias
# 02/12/2025
#########################################################################

#########################################################################
#                     Define colors with variables                      #
#########################################################################

# For menu titles: Underlined and yellow
TITLE='\033[4;33m'
# Used for labels: purple
LABEL='\033[0;35m'
# Used for FALSE: red
RED='\033[0;31m'
# Used for TRUE: green
GREEN='\033[0;32m'
# Reset color at end of line
NC='\033[0m'

#########################################################################

#########################################################################
#                              Variable                                 #
#########################################################################

# Variable Script lock_computer
countdown=5

#########################################################################

#########################################################################
#                           Bash Function                               #
#########################################################################

# ---------------------- Menu function -----------------------------
# Main menu, which calls the main User and Computer menus
menu()
    {
    while true; do
        clear
        echo -e "${TITLE}Menu :${NC}"
        echo -e "1) Utilisateur"
        echo -e "2) Ordinateur"
        echo -e "3) Sortie"
        read -p "Votre choix :" choice

        case $choice in
            1)  menu_user;; 
            2)  menu_computer;;
            3)  echo -e "Exit - FIN DE SCRIPT"
                exit 0;;
            *)  echo -e "Erreur";;
        esac
    done
    }

## User menu, which calls the Action and Information menus for the user
menu_user()
    {
        clear
        while true; do
            echo -e "${TITLE}Menu utilisateur:${NC}"
            echo -e "1) Action"
            echo -e "2) Information"
            echo -e "3) Retour"
            echo -e "4) Exit"
            read -p "Votre choix :" choice2

            case $choice2 in
                1)  menu_user_action;;
                2)  menu_user_information;;
                3)  echo -e "Retour"
                    clear
                    break;;
                4)  echo -e "Exit - FIN DE SCRIPT"
                    exit 0;;
                *)  echo -e "ERREUR";;
            esac
        done
    }

### User action menu, which calls the Actions for the user
menu_user_action()
    {
    clear
        while true; do
            echo -e "${TITLE}Menu action utilisateur:${NC}"
            echo -e "1) Création de compte utilisateur local"
            echo -e "2) Changement de mot de passe"
            echo -e "3) Suppression de compte utilisateur local"
            echo -e "4) Ajout à un groupe d'administration"
            echo -e "5) Ajout à un groupe"
            echo -e "6) Retour"
            echo -e "7) Exit"
            read -p "Votre choix :" choice3

            case $choice3 in
                1)  clear
                    source ~/Documents/scripts/user/actions/script_creating_local_user.sh;;
                2)  clear
                    source ~/Documents/scripts/user/actions/;;
                3)  clear
                    source ~/Documents/scripts/user/actions/;;
                4)  clear
                    source ~/Documents/scripts/user/actions/;;
                5)  clear
                    source ~/Documents/scripts/user/actions/;;
                6)  clear
                    break;;
                7)  echo -e "Exit - FIN DE SCRIPT"
                    exit 0;;
                *)  echo -e "ERREUR";;
            esac
        done
    }


### User information menu, which calls the information for the user
menu_user_information()
    {
        clear
        while true; do
            echo -e "${TITLE}Menu information utilisateur:${NC}"
            echo -e "1) Droits/permissions de l’utilisateur sur un dossier"
            echo -e "2) Recherche des evenements dans le fichier log_evt.log pour un utilisateur"
            echo -e "3) Retour"
            echo -e "4) Exit"
            read -p "Votre choix :" choice3

            case $choice3 in
                1)  clear
                    source ~/Documents/scripts/user/informations/;;
                2)  clear
                    source ~/Documents/scripts/user/informations/;;
                3)  clear
                    break;;
                4)  echo -e "Exit - FIN DE SCRIPT"
                    exit 0;;
                *)  echo -e "ERREUR";;
            esac
        done
    }

## Computer menu, which calls the Action and Information menus for the computer
menu_computer()
    {
        clear
        while true; do
            echo -e "${TITLE}Menu ordinateur:${NC}"
            echo -e "1) Action"
            echo -e "2) Information"
            echo -e "3) Retour"
            echo -e "4) Exit"
            read -p "Votre choix :" choice2

            case $choice2 in
                1)  menu_computer_action;;
                2)  menu_computer_information;;
                3)  clear
                    break;;
                4)  echo -e "Exit - FIN DE SCRIPT"
                    exit 0;;
                *)  echo -e "ERREUR";;
            esac
        done
    }

### Computer action menu, which calls the actions for the computer
menu_computer_action()
    {
        clear
        while true; do
            echo -e "${TITLE}Menu action ordinateur:${NC}"
            echo -e "1) Verrouillage"
            echo -e "2) Redémarrage"
            echo -e "3) Activation du pare-feu"
            echo -e "4) Création de répertoire"
            echo -e "5) Suppression de répertoire"
            echo -e "6) Prise de main à distance (CLI)"
            echo -e "7) Retour"
            echo -e "8) Exit"
            read -p "Votre choix :" choice3

            case $choice3 in
                1)  clear
                    source ~/Documents/scripts/computer/actions/script_lock.sh;;
                2)  clear
                    source ~/Documents/scripts/computer/actions/;;
                3)  clear
                    source ~/Documents/scripts/computer/actions/;;
                4)  clear
                    source ~/Documents/scripts/computer/actions/;;
                5)  clear
                    source ~/Documents/scripts/computer/actions/;;
                6)  clear
                    source ~/Documents/scripts/computer/actions/;;
                7)  clear
                    break;;
                8)  echo -e "Exit - FIN DE SCRIPT"
                    exit 0;;
                *)  echo -e "ERREUR";;
            esac
        done
    }

### Computer information menu, which calls the information for the computer
menu_computer_information()
    {
        clear
        while true; do
            echo -e "${TITLE}Menu action ordinateur:${NC}"
            echo -e "1) Adresse IP, masque, passerelle"
            echo -e "2) Version de l'OS"
            echo -e "3) Carte graphique"
            echo -e "4) CPU %"
            echo -e "5) uptime"
            echo -e "6) Température CPU"
            echo -e "7) Nombre de disque"
            echo -e "8) Partition (nombre, nom, FS, taille) par disque"
            echo -e "9) Espace disque restant par partition/volume"
            echo -e "10) Liste des utilisateurs locaux"
            echo -e "11) 5 derniers logins"
            echo -e "12) 10 derniers événements critiques"
            echo -e "13) Recherche des evenements dans le fichier log_evt.log pour un ordinateur"
            echo -e "14) Retour"
            echo -e "15) Exit"
            read -p "Votre choix :" choice3

            case $choice3 in
                1)  clear
                    source ~/Documents/scripts/computer/informations/;;
                2)  clear
                    source ~/Documents/scripts/computer/informations/script_os_version.sh;;
                3)  clear
                    source ~/Documents/scripts/computer/informations/;;
                4)  clear
                    source ~/Documents/scripts/computer/informations/;;
                5)  clear
                    source ~/Documents/scripts/computer/informations/;;
                6)  clear
                    source ~/Documents/scripts/computer/informations/;;
                7)  clear
                    source ~/Documents/scripts/computer/informations/script_number_disk.sh;;
                8)  clear
                    source ~/Documents/scripts/computer/informations/;;
                9)  clear
                    source ~/Documents/scripts/computer/informations/;;
                10) clear 
                    source ~/Documents/scripts/computer/informations/;;
                11) clear 
                    source ~/Documents/scripts/computer/informations/;;
                12) clear 
                    source ~/Documents/scripts/computer/informations/;;
                13) clear 
                    source ~/Documents/scripts/computer/informations/;;
                14) clear
                    break;;
                15) echo -e "Exit - FIN DE SCRIPT"
                    exit 0;;
                *)  echo -e "ERREUR";;
            esac
        done
    }

#########################################################################

#########################################################################
#                       Powershell Functions                            #
#########################################################################

#########################################################################

#########################################################################
#                               Script                                  #
#########################################################################

# Ask for the desired computer
    
    while true; do
        echo -e "${TITLE}Menu TEST SSH :${NC}"
        echo -e "1) Connexion SSH"
        echo -e "2) Déjà connecté !"
        echo -e "3) Sortie"
        read -p "Votre choix :" choice4

        case $choice4 in
            1)  clear
                echo -e "${TITLE}Sur quel ordinateurs voulez-vous vous connecter ?${NC}"
                echo -e "${LABEL}Format accepté : Nom complet ou adresse IP${NC}"
                echo ""
                # ask target and save un variable
                read -p "L'ordinateur voulu :" target_computer

                # Check if the requested computer exists in the SSH connection software
                clear
                # show hosts et 
                if ! cat /etc/hosts | grep "$target_computer"
                then
                    echo "L'odinateur demandé n'existe pas veuillez nous mentionné un ordinateur existant dans le réseau."
                    exit 1
                else
                    echo -e "${LABEL}Connexion à $target_computer${NC}"
                    read -p "L'utilisateur voulu :" target_user
                    # Copier TOUT le dossier scripts vers ~/Documents/ sur la machine distante
                    scp -r ~/Documents/scripts "$target_user@$target_computer:~/Documents/"
                    # Lancer PapaScript à distance depuis ce dossier
                    ssh -t "$target_user@$target_computer" "bash ~/Documents/scripts/script_dady_v8.sh"
                        if [[ ! $? -eq 0 ]]
                        then
                            echo -e "${RED}WARNING !!! L'utilisatuer $target_user n'existe pas !!!${NC}"
                            exit 1
                        fi
                fi;; 
            2)  clear
                menu;;
            3)  echo -e "Exit - FIN DE SCRIPT"
                exit 0;;
            *)  echo -e "Erreur";;
        esac
    done

#########################################################################