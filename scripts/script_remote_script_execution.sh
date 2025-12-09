#!/bin/bash

#########################################################################
# Script remote script execution
# Chicaud Matthias
# Execution SUDO
# 07/12/2025
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
# Variable
#########################################################################

# Variable to argument in papa_script
target_computer="$1"
target_user="$2"

#########################################################################
# Function
#########################################################################
execution_script_sudo()
    {
     local script_name="$1"   
     echo -e "${TITLE}Connexion à $target_user sur la machine $target_computer et éxécution du $script_name${NC}"
                    scp ~/Documents/scripts/"$script_name" "$target_user"@"$target_computer":/tmp/ &> /dev/null
                        if [ $? -eq 0 ]
                        then
                            ssh -t "$target_user"@"$target_computer" "sudo bash /tmp/"$script_name""
                            if [ $? -eq 0 ]
                            then
                                echo "Le $script_name a été exécuter avec succès"
                                echo ""
                                ###########################################################################
                                # Retrieve directory 

                                # Define local directory for storing downloaded info files
                                local_info_dir="$HOME/Documents/TSSR-1025-P2-G1/ressources/scripts/info"
                                # Create the local /info directory if it does not exist
                                mkdir -p "$local_info_dir"
                                # Check if the retrieval was successful
                                scp "$target_user"@"$target_computer":/tmp/info/* "$local_info_dir"/  &> /dev/null
                                    if [ $? -eq 0 ]
                                    then
                                        echo "Les fichiers info ont été rapatriés dans $local_info_dir"
                                        echo ""
                                    else
                                        echo -e "${RED}WARNING !!!${NC} Aucun fichier info récupéré ou dossier vide."
                                        echo ""
                                    fi
                                ###########################################################################
                            else
                                echo -e "${RED} WARNING !!! ${NC} Le $script_name ne s'est pas éxécuté !!!"
                                echo ""
                                log_event_connexion "ERREURScriptNonExecuterSortieSSH"
                                exit 1
                            fi
                            ssh "$target_user"@"$target_computer" "rm /tmp/"$script_name""
                                if [ $? -eq 0 ]
                                then
                                    echo "Le fichier $script_name a bien été effacer de $target_computer"
                                    echo ""
                                else
                                    echo -e "${RED} WARNING !!! ${NC} Le fichier $script_name n'a pas été supprimé de $target_computer"
                                    echo ""
                                    log_event_connexion "ERREURFichierNonSupprimeSortieSSH"
                                    exit 1
                                fi
                        else
                            echo -e "${RED} WARNING !!! ${NC} La connexion SSH où le chemin d'accès du script n'a pas fonctionner"
                            log_event_connexion "ERREURConnexionSSHouCheminScript"
                            exit 1
                        fi  
    }
#########################################################################
# Script
#########################################################################

# menu name display
    clear
    echo -e "${TITLE}Utilisation de script à distance${NC}"
    echo ""
    echo "Quel script voulez-vous utilisez à distance ?" 
    read -p "Le chemin vers votre script : " script_name

    if [ ! -f "$script_name" ]
    then
        echo -e "${RED}WARNING !${NC} Le script $script_name n'éxiste pas"
        echo ""
    else
        echo -e "${GREEN}le script $script_name existe bien.${NC}"
        echo ""
        execution_script_sudo $script_name
    fi

#########################################################################