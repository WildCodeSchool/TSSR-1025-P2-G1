#!/bin/bash
#############################
# Script temp_cpu
# 2025/12/01
##############################

echo "Vérification de la température du CPU"
echo "---"

# Checked if 'sensors' is installed
if command -v sensors &> /dev/null
then
# Exécution de la commande 'sensors' et filtrage
    sensors 2>/dev/null | grep -E 'Core |Package id'
    
# Vérifie si le filtre a trouvé des données
        if [ $? -eq 0 ];
        then
            echo "Capteurs détectés : Affichage des températures :"
        else
            echo "Aucun capteur CPU fonctionnel n'a été trouvé."
        fi    
else
    # Si la commande n'est pas installée : affiche le message d'erreur
    echo "ATTENTION : La commande 'sensors' est introuvable."
    echo "Utiliser 'sudo apt install lm-sensors' pour l'installer"
fi
return 0
