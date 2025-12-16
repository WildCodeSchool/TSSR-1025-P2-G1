#########################################################################
# Script info partition
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
Write-Host "Suppression de répertoire:" -ForegroundColor Yellow
Write-Host ""

while ($true)
{
    # request for the name of the directory to be deleted.
    Write-Host "Exemple: C:\Temp\MonDossier" -ForegroundColor DarkMagenta
    Write-Host ""

    $directory = Read-Host "Quel est le chemin et le nom du répertoire à supprimer"

    # verification empty captation
    if ([string]::IsNullOrWhiteSpace($directory)) {
    Write-Host "WARNING : chemin vide, recommence." -ForegroundColor Red
    continue
    }
    # verification of the directory to be deleted.
    if ( Test-Path -Path $directory -PathType Container ) 
    {
        
        try
        {
            Remove-Item -Path $directory -Recurse -Force -ErrorAction Stop | Out-Null
            Write-Host "le dossier '$directory' a été supprimé" -ForegroundColor Green
            break
        }
        catch
        {
            Write-Host "WARNING : le dossier '$directory' n'a pas été supprimé !!!" -ForegroundColor Red
            Write-Host $_
            break
        }
    }
    else
    { 
        Write-Host "WARNING : le dossier '$directory' n'existe pas, veuillez proposez un autre chemin avec un nom valide :" -Foregroundcolor Red
        continue
    }
}     
exit 0

#########################################################################