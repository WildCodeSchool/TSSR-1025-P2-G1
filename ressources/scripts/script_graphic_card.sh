#!/bin/bash
#############################
# Script graphic_card
# 2025/11/29
##############################

echo "Détails de la carte graphique"

# Checked if 'lshw' is installed
if command -v lshw &> /dev/null
then
    echo "Recherche de la carte graphique"
# Command execution
    lshw -C display    
else
# Command isn't installed : error message
    echo "ATTENTION : La commande 'lshw' n'est pas installée."
fi
return 0
