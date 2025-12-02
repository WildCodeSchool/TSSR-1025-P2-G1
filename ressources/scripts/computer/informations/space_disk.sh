#!/bin/bash
#############################
# Script space_disk
# 2025/12/01
##############################

echo -e "${TITLE}Mes disques et partitions${NC}"
echo ""

# Affichage des disques et partition
lsblk -f
return 0
