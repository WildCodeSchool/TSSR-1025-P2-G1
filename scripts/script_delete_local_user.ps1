#########################################################################
# Script delete user
# Chicaud Matthias
# 15/12/2025
#########################################################################

#########################################################################
# Variable
#########################################################################

# Variable for save_info function

# $info_target = "wilder" # Uncomment for user script
$info_target = $env:COMPUTERNAME # Uncomment for computer script

#########################################################################
# Script
#########################################################################

# Title
Write-Host "Suppression d'utilisateur:" -ForegroundColor Yellow
Write-Host ""

# request for the name of the directory to be deleted.
    $user = Read-Host "Quel est l'utilisateur a supprimer"

    # verification of the directory to be deleted.
    $exists = Get-LocalUser -Name $user -ErrorAction SilentlyContinue
    if ( -not $exists )
    {
        Write-Host "WARNING : l'utilisateur $user n'existe pas." -Foregroundcolor Red
        exit 1
    }
    try
    {
        Remove-LocalUser -Name $user -ErrorAction Stop
        Write-Host "l'utilisateur $user a ete supprimer" -ForegroundColor Green
        exit 0
    }
    catch
    {
        Write-Host "WARNING : l'utilisateur "$user" n'a pas ete supprimer !!!" -ForegroundColor Red
        Write-Host $_
        exit 1
    }
exit 0

#########################################################################