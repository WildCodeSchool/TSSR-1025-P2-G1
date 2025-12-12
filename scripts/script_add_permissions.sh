#!/bin/bash

#########################################################################
# Script add permissions
# Jouveaux Nicolas
# Execution SUDO
# 11/12/2025
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

#########################################################################
# Function
#########################################################################

#########################################################################
# Script
#########################################################################

# menu name display
    
    echo -e "${TITLE}Ajouter des droits et permissions à un utilisateur${NC}"
    echo ""

# Wich user
while true
do
    read -p "Quel utilisateur ? : " username

# Verification if user exist
    echo ""

    if id "$username" >/dev/null 2>&1
    then
        echo -e "${GREEN}Utilisateur $username trouvé.${NC}"
        break
    else
        echo -e "${RED}Erreur : l'utilisateur $username n'existe pas sur ce système.${NC}"
        read -p "Voulez-vous réessayer ? (o/n) : " retry
        [ "$retry" != "o" ] &&
        exit 1
    fi
done

    echo ""

# Wich folder
while true
do
    read -p "Quel dossier ? (chemin du dossier) : " folder
    
# Verification if folder exist
    if [ -d "$folder" ]
    then
        echo -e "${GREEN}Dossier $folder trouvé.${NC}"
        break
    else
        echo -e "${RED}Erreur : le dossier $folder n'existe pas.${NC}"
        read -p "Voulez-vous réessayer ? (o/n) : " retry
        [ "$retry" != "o" ]
        exit 1
    fi
done

    echo ""

# Wich permissions
while true
do
        echo -e "${TITLE}Type de permissions à appliquer${NC}"
        echo -e "1) Lecture seule"
        echo -e "2) Lecture et écriture"
        echo -e "3) Lecture, écriture et exécution"
        read -p "Votre choix : " choice
        
        echo ""

# Set permissions according to choice
        case $choice in
            1)  permissions="u+r,u-wx,g+r,g-wx,o+r,o-wx"
                break;;
            2)  permissions="u+rwx,g+rw,o+rw"
                break;;
            3)  permissions="u+rwx,g+rwx,o+rwx"
                break;;
            *)  echo -e "Erreur"
        esac
    done

    echo ""

# Ask for confirmation
read -p "Vouslez-vous vraiment autoriser ces permissions ? (o/n) : " confirm

if [[ "$confirm" != "o" && "$confirm" != "O" ]]
then
    echo "Opération annulée."
    exit 0
fi

    echo ""

# Apply permissions
if chmod "$permissions" "$folder"
then
    echo -e "${GREEN}Droits appliqués avec succès sur '$folder'${NC}"
    
# Display current permissions
    echo ""
    
    echo "Vérification des droits actuels :"
    ls -ld "$folder"
fi

# Countdown 5 seconds before exit
for i in {5..1}; do
    echo -ne "Effacement dans $i\r"
    sleep 1
done
clear
exit 0
############################################################################