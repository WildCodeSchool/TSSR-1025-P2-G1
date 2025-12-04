#!/bin/bash
#############################
# Script firewall
# Nicolas Jouveaux
# 2025/12/01
##############################

echo -e "${TITLE}Statut du pare-feu${NC}"
echo ""

echo "1) Activer le pare-feu"
echo "2) Désactiver le pare-feu"
echo ""
read -p "➤ Choisis 1 ou 2 : " rep

if [ "$rep" = "1" ]; then
    echo "Activation du pare-feu"
    sudo ufw --force enable >/dev/null 2>&1
    echo "Pare-feu activé"
else
    echo "Désactivation du pare-feu"
    sudo ufw disable >/dev/null 2>&1
    echo "Pare-feu désactivé => OPEN-BAR"
fi
return 0