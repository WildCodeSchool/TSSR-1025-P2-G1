#!/bin/bash
#############################
#Script percent_cpu
#Jouveaux Nicolas
#2025/11/30
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
    echo -e "${TITLE}CPU %${NC}"
    echo ""


    # Data Recovery
CPU=$(vmstat 1 2 | tail -n 1)

PERCENT=$(echo "$CPU" | awk '{print $15}')

    # Usage calculation
CPU_USAGE=$(echo "100 - $PERCENT" | bc -l)

    # Displaying the result
        echo "Utilisation du CPU : **$CPU_USAGE %**"
        echo ""
exit 0
