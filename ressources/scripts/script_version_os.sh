#!/bin/bash

#########################################################################
# Script version os
# Paisant Franck
# 30/11/2025
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

# Script
#########################################################################

# menu name display
    echo -e "${TITLE}Version de l'OS${NC}"
    echo ""

#command to display the OS version
version=$(lsb_release -ds 2>/dev/null)
    echo -e "${TITLE}$version${NC}"
    echo ""
exit 0

#########################################################################