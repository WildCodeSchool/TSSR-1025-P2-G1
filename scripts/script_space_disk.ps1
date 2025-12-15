#########################################################################
# Script space disk
# Jouveaux Nicolas
# 10/12/2025
#########################################################################

#########################################################################
# Variable
#########################################################################

# Variable for save_info function

# $info_target = "wilder" # Uncomment for user script
$info_target = $env:COMPUTERNAME # Uncomment for computer script
$info_date = Get-Date -Format "yyyyMMdd"
$info_dir = "C:\Users\$env:USERNAME\Documents\info"
$info_file = "$info_dir\info_${info_target}_${info_date}.txt"

#########################################################################
# Function
#########################################################################

# Function for save information in file
function save_info {
    param(
        [string]$label,
        [string]$value
    )

    $time_save_info = Get-Date -Format "HH:mm:ss"

    # Création dossier si existe pas 
   if (-Not (Test-Path $info_dir)) {
        New-Item -Path $info_dir -ItemType Directory -Force | Out-Null
    }
    # Sauvegarder information dans le fichier
     "[$time_save_info] $label : $value" | Out-File -FilePath $info_file -Append
}

#########################################################################
# Script
#########################################################################

# Title
    Write-Host "Espace disque restant par partition/volume" -ForegroundColor Yellow
    Write-Host ""

    Write-Host "Mes disques et partitions"
    Write-Host

# Display disks and partitions
    Get-Volume | Format-Table -Property DriveLetter, FileSystemLabel, FileSystem, SizeRemaining, Size -AutoSize
    Write-Host ""
    
# Save information
    save_info -label "Espace disque par partition/volume" -value $value
exit 0
#########################################################################