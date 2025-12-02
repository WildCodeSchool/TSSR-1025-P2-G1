#!/bin/bash
#############################
# Script temp_cpu
# 2025/12/01
##############################

echo -e "${TITLE}Vérification de la température du CPU${NC}"
echo ""

# Checked if 'sensors' is installed
if command -v sensors &> /dev/null
then
# Execution of the 'sensors' command and filtering.
    sensors 2>/dev/null | grep -E 'Core |Package id'
    
# Check if the filter found any data. 
        if [ $? -eq 0 ];
        then
            echo "Capteurs détectés : Affichage des températures :"
        else
            echo "Aucun capteur CPU fonctionnel n'a été trouvé."
        fi    
else
# If the command is not installed: display the error message
    echo "ATTENTION : La commande 'sensors' est introuvable."
    echo "Utiliser 'sudo apt install lm-sensors' pour l'installer"
fi
return 0
