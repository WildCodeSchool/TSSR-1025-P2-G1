#!/bin/bash

#########################################################################
# Script suppression repertory
# Paisant Franck
# Execution SUDO
# 04/12/2025
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
# Script
#########################################################################

# menu name display
    echo -e "${TITLE}Suppression d'un répertoire${NC}"
    echo ""
while true
do
    # request for the name of the directory to be deleted.
    echo -e "${LABEL}Exemple: /tmp/monrepertoire ou /home/user/repertoire${NC}"
    echo ""
    read -p "Quel est le chemin et le nom du répertoire à supprimer ?: " repertory

    # verification of the directory to be deleted.
    if [ -d "$repertory" ]
    then
        echo -e "${GREEN} le $repertory existe bien !${NC}"
        read -p "Confirmer vous la suppression o/n ?" choix
            echo ""
            if [ "$choix" = "o" ]
            then
                rm -r "$repertory"
                echo -e " le $repertory a été ${RED}supprimé avec succès!!${NC}"
                echo ""
                break
            elif [ "$choix" = "n" ]
            then
                echo-e " WARNING le $repertory ${RED}n'a pas été supprimé !!!${NC}"
                echo""
                break
            else
                echo "Choix invalide"
                continue
            fi    
    else 
    echo -e "${RED}WARNING !!!${NC} le $repertory n'existe pas !!!!"
    continue
    fi
done     
exit 0
############################################################################