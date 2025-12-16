#!/bin/bash
#############################
# Script space_disk
# Jouveaux Nicolas
# 01/12/2025
##############################

#########################################################################
#                     Define colors with variables                      #
#########################################################################

# For menu titles: Underlined and yellow
TITLE='\033[1;33m'
# Used for labels: purple
LABEL='\033[1;94m'
# Used for FALSE: red
RED='\033[0;91m'
# Used for TRUE: green
GREEN='\033[0;32m'
# Reset color at end of line
NC='\033[0m'
# white
WHITE='\033[1;97m'

#########################################################################

#########################################################################
# Script
#########################################################################

# menu name display
    echo -e "${TITLE}Espace disque restant par partition/volume${NC}"
    echo ""


echo "=== Mes disques et partitions ==="
echo ""

# Affichage des disques et partition
lsblk -f
exit 0
############################################################################
