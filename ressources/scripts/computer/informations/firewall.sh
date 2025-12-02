#!/bin/bash
#############################
# Script firewall
# 2025/12/01
##############################

echo -e "${TITLE}Statut du pare-feu${NC}"
echo ""

# Display status of the firewall
ufw status | grep -q "Status: active"
if [ $? -eq 0 ]
then
    echo "Le pare-feu est activé."
    read -p "Voulez-vous le désactiver ? (o/n) : " reply
    if [ "$reply" = "o" ]
    then
        echo "Le pare-feu a été désactivé."
    else
        echo "Le pare-feu est toujours activé."
    fi
else
    echo "Le pare-feu est désactivé."
    read -p "Voulez-vous l'activer ? (o/n) : " reply
    if [ "$reply" = "o" ]
    then
        echo "Le pare-feu a été activé."
    else
        echo "Le pare-feu est toujours désactivé."
    fi
fi
return 0 
