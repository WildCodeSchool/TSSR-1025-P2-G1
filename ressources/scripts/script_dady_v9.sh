#!/bin/bash

#########################################################################
# Script Dady V.9
# script must be executed with "sudo"
# Chicaud Matthias/Paisant Franck
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

# Variable user
target_user=wilder

#########################################################################

#########################################################################
#                           Bash Function                               #
#########################################################################

#-------------------- Execution script ----------------------------------
#function to run a script with file call
execution_script()
    {
     local script_name="$1"   
     echo "Connexion à $target_computer et éxécution du $script_name"
                    scp ~/Projet_2/TSSR-1025-P2-G1/ressources/scripts/"$script_name" "$target_user"@"$target_computer":/tmp/ &> /dev/null
                        if [ $? -eq 0 ]
                        then
                            ssh "$target_user"@"$target_computer" "bash /tmp/"$script_name""
                            if [ $? -eq 0 ]
                            then
                                echo "Le $script_name a été exécuter avec succès"
                                echo ""
                            else
                                echo -e "${RED} WARNING !!! ${NC} Le $script_name ne s'est pas éxécuter !!!"
                                echo ""
                                exit 1
                            fi
                            ssh "$target_user"@"$target_computer" "rm /tmp/"$script_name""
                                if [ $? -eq 0 ]
                                then
                                    echo "Le fichier $script_name a bien été effacer de $target_computer"
                                    echo ""
                                else
                                    echo -e "${RED} WARNING !!! ${NC} Le fichier $script_name n'a pas été supprimer de $target_computer"
                                    echo ""
                                    exit 1
                                fi
                        else
                            echo -e "${RED} WARNING !!! ${NC} La connexion SSH où le chemin d'accès du script n'a pas fonctionner"
                            exit 1
                        fi  
    }
#Function to run a script in sudo mode with file call
execution_script_sudo()
    {
     local script_name="$1"   
     echo "Connexion à $target_computer et éxécution du $script_name"
                    scp ~/Projet_2/TSSR-1025-P2-G1/ressources/scripts/"$script_name" "$target_user"@"$target_computer":/tmp/ &> /dev/null
                        if [ $? -eq 0 ]
                        then
                            ssh -t "$target_user"@"$target_computer" "sudo bash /tmp/"$script_name""
                            if [ $? -eq 0 ]
                            then
                                echo "Le $script_name a été exécuter avec succès"
                                echo ""
                            else
                                echo -e "${RED} WARNING !!! ${NC} Le $script_name ne s'est pas éxécuter !!!"
                                echo ""
                                exit 1
                            fi
                            ssh "$target_user"@"$target_computer" "rm /tmp/"$script_name""
                                if [ $? -eq 0 ]
                                then
                                    echo "Le fichier $script_name a bien été effacer de $target_computer"
                                    echo ""
                                else
                                    echo -e "${RED} WARNING !!! ${NC} Le fichier $script_name n'a pas été supprimer de $target_computer"
                                    echo ""
                                    exit 1
                                fi
                        else
                            echo -e "${RED} WARNING !!! ${NC} La connexion SSH où le chemin d'accès du script n'a pas fonctionner"
                            exit 1
                        fi  
    }
# ---------------------- Menu function -----------------------------
# Main menu, which calls the main User and Computer menus
menu()
    {
    while true; do
        clear
        echo -e "${TITLE}Menu :${NC}"
        echo -e "1) Utilisateur (Action/Information)"
        echo -e "2) Ordinateur  (Action/Information)"
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
                        execution_script_sudo "script_creating_local_user.sh"
                    ;;
                2)  clear
                    ;;
                3)  clear
                    ;;
                4)  clear
                        execution_script_sudo "script_add_group_administration.sh"
                    ;;
                5)  clear
                    ;;
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
                    ;;
                2)  clear
                    ;;
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
                        execution_script "script_lock.sh"
                    ;;
                2)  clear
                    ;;
                3)  clear
                        execution_script_sudo "script_firewall.sh"
                    ;;
                4)  clear
                    ;;
                5)  clear
                    ;;
                6)  clear
                    ;;
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
                    ;;
                2)  clear
                        execution_script "script_version_os.sh"
                    ;;
                3)  clear
                        execution_script_sudo "script_graphic_card.sh"
                    ;;
                4)  clear
                        execution_script "script_percent_cpu.sh"
                    ;;
                5)  clear
                    ;;
                6)  clear
                        execution_script "script_temp_cpu.sh"
                    ;;
                7)  clear
                    ;;
                8)  clear
                    ;;
                9)  clear
                        execution_script "script_space_disk.sh"
                    ;;
                10) clear 
                    ;;
                11) clear 
                    ;;
                12) clear 
                    ;;
                13) clear 
                    ;;
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
while true
do
    clear
    echo -e "${TITLE}Sur quel Poste Client voulez-vous vous connecter ?${NC}"
    echo -e "${LABEL}Format accepté : Nom complet ou adresse IP${NC}"
    echo ""
    # ask target and save un variable
    read -p "Le Poste Client demander :" target_computer

    # Check if the requested computer exists in the SSH connection software
    clear
    # show hosts et check if user is on
    if ! cat /etc/hosts | grep "$target_computer"
    then
        echo -e "${RED}Le Poste client demandé n'existe pas sur notre réseaux ${NC} veuillez mentionner un PC existant dans notre réseau."
        echo ""
        read -p " Appuyer sur Entréé pour réessayer..."
    else
        break 
    fi
done

menu
            

#########################################################################