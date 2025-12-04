#!/bin/bash
#############################
# Script firewall
# Jouveaux Nicolas
# Execution SUDO
# 2025/12/01
##############################
#########################################################################
# Variable
#########################################################################

countdown=5

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
    echo -e "${TITLE}Activation du Pare-Feu${NC}"
    echo ""

# Afficher le status du pare-feu
ufw status | grep -q "Status: active"
if [ $? -eq 0 ]
then
    echo "Le pare-feu est activé."
    read -p "Voulez-vous le désactiver ? (o/n) : " reply
    if [ "$reply" = "o" ]
    then
        echo "Le pare-feu a été désactivé."
        echo ""
    else
        echo "Le pare-feu est toujours activé."
        echo ""
    fi
else
    echo "Le pare-feu est désactivé."
    read -p "Voulez-vous l'activer ? (o/n) : " reply
    if [ "$reply" = "o" ]
    then
        echo "Le pare-feu a été activé."
        echo ""
    else
        echo "Le pare-feu est toujours désactivé."
        echo ""
    fi
fi
exit 0 
