#!/bin/bash
#############################
# Script graphic_card
# Jouveaux Nicolas
# 2025/11/29
##############################

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
    echo -e "${TITLE}Carte graphique${NC}"
    echo ""

echo "Détails de la carte graphique"
echo ""

# Checked if 'lshw' is installed
if command -v lshw &> /dev/null
then
    echo "Recherche de la carte graphique"
# Command execution
    lshw -C display    
else
# Command isn't installed : error message
    echo "ATTENTION : La commande 'lshw' n'est pas installée."
    echo ""
fi
exit 0
