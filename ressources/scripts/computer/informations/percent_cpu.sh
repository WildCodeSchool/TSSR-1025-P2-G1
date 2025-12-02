#!/bin/bash
#############################
#Script percent_cpu
#2025/11/30
##############################

echo -e "${TITLE}Vérification de l'utilisation du CPU${NC}"
echo ""

# Data Recovery
CPU=$(vmstat 1 2 | tail -n 1)

PERCENT=$(echo "$CPU" | awk '{print $15}')

# Usage calculation
CPU_USAGE=$(echo "100 - $PERCENT" | bc -l)

# Displaying the result
        echo "Utilisation du CPU : **$CPU_USAGE %**"
return 0
