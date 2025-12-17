#########################################################################
# Script change password
# Chicaud Matthias
# 17/12/2025
#########################################################################
# --- Fix encodage console/SSH ---
chcp 65001 > $null
[Console]::InputEncoding  = [System.Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
$OutputEncoding           = [System.Text.UTF8Encoding]::new($false)
#########################################################################
# Variable
#########################################################################

#########################################################################
# Function
#########################################################################

#########################################################################
# Script
#########################################################################
# menu name display
    Write-Host "Changement du mot de passe d'un utilisateur" -ForegroundColor Yellow
    Write-Host ""

    $user = Read-Host "Modifier le mot de pass sur quel utilisateur"
    
$exists = Get-LocalUser -Name $user -ErrorAction SilentlyContinue
    if ( $exists )
    {
        Write-Host "WARNING : L'utilisateur '$user' existe déjà." -Foregroundcolor Red
        exit 1
    }
    try
    {
        New-LocalUser -Name $user -NoPassword -ErrorAction Stop | Out-Null
        Write-Host "L'utilisateur '$user' a été créé" -ForegroundColor Green
        
    }
    catch
    {
        Write-Host "WARNING : L'utilisateur '$user' n'a pas été créé !!!" -ForegroundColor Red
        Write-Host ""
        exit 1
    }
exit 0


#############################################################################