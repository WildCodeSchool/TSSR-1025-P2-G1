#!/bin/bash
#############################
# Script temp_cpu
# Jouveaux Nicolas
# 01/12/2025
##############################

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
    echo -e "${TITLE}Température CPU${NC}"
    echo ""

echo -e "${GREEN}Vérification de la température du CPU${NC}"
echo "---"

# Checked if 'sensors' is installed
if command -v sensors &> /dev/null
then
# Exécution de la commande 'sensors' et filtrage
    sensors 2>/dev/null | grep -E 'Core |Package id'
    
# Vérifie si le filtre a trouvé des données
        if [ $? -eq 0 ];
        then
            echo -e "${GREEN}Capteurs détectés : Affichage des températures :${NC}"
            echo ""
        else
            echo "${RED}Aucun capteur CPU fonctionnel n'a été trouvé.${NC}"
            echo ""
        fi    
else
    # Si la commande n'est pas installée : affiche le message d'erreur
    echo -e "${RED}ATTENTION : La commande 'sensors' est introuvable.${NC}"
    echo -e "${RED}Utiliser 'sudo apt install lm-sensors' pour l'installer${NC}"
    echo ""
fi
exit 0
############################################################################
