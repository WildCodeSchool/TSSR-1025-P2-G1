#!/bin/bash

#########################################################################
# Script show the number of disk
# Chicaud Matthias
# 07/12/2025
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
# Variable
#########################################################################

# Variable for save_info function

info_target="$(hostname)"
info_date="$(date +%Y%m%d)"
info_dir="/home/$(whoami)/Documents/info"
info_file="$info_dir/info_${info_target}_${info_date}.txt"

#########################################################################
# Function
#########################################################################

# Function for save information in file
save_info()
{
    local label="$1"
    local value="$2"
    local time_save_info="$(date +%H:%M:%S)"
    mkdir -p "$info_dir"
    echo "[$time_save_info] $label : $value" >> "$info_file"
}

#########################################################################
# Script
#########################################################################

# Title
echo -e "${TITLE}Nombre de disque${NC}"
echo ""
# Nombre de disque
number_disk="$(lsblk | wc -l)"
echo -e "Le nombre de disque sur la machine : $number_disk"

# Save information
value="$number_disk"
save_info "Nombre de disque" "$value"

#########################################################################