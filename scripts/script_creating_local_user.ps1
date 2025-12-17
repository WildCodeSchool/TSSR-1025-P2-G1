#########################################################################
# Script create user
# Paisant Franck
# 16/12/2025
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
Write-Host "Creation compte utilisateur local:" -ForegroundColor Yellow
Write-Host ""

# request for the name of the directory to be creating.
    $user = Read-Host "Quel est l'utilisateur à creer"

    # verification of the directory to be creating.
    $exists = Get-LocalUser -Name $user -ErrorAction SilentlyContinue
    if ( $exists )
    {
        Write-Host "WARNING : L'utilisateur '$user' existe deja." -Foregroundcolor Red
        exit 1
    }
    try
    {
        New-LocalUser -Name $user -NoPassword -ErrorAction Stop | Out-Null
        Write-Host "L'utilisateur '$user' a ete cree" -ForegroundColor Green
        
    }
    catch
    {
        Write-Host "WARNING : L'utilisateur '$user' n'a pas ete cree !!!" -ForegroundColor Red
        Write-Host ""
        exit 1
    }
exit 0

#########################################################################