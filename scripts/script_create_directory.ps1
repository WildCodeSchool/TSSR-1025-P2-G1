#########################################################################
# Script create directory
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
Write-Host "Creation de repertoire:" -ForegroundColor Yellow
Write-Host ""

while ($true)
{
    # request for the name of the directory to be deleted.
    Write-Host "Exemple: C:\Temp\MonDossier" -ForegroundColor DarkMagenta
    Write-Host ""

    $directory = Read-Host "Quel est le chemin et le nom du repertoire à creer"

    # verification empty captation
    if ([string]::IsNullOrWhiteSpace($directory)) {
    Write-Host "WARNING : chemin vide, recommence." -ForegroundColor Red
    continue
    }
    # verification of the directory to be deleted.
    if (-not ( Test-Path -Path $directory -PathType Container ) )
    {
        
        try
        {
            New-Item -ItemType Directory -Path $directory -ErrorAction Stop | Out-Null
            Write-Host "le dossier '$directory' à ete cree" -ForegroundColor Green
            break
        }
        catch
        {
            Write-Host "WARNING : le dossier '$directory' n'a pas ete cree !!!" -ForegroundColor Red
            Write-Host $_
            break
        }
    }
    else
    { 
        Write-Host "WARNING : le dossier '$directory' existe deja, veuillez proposez un autre chemin avec un nom valide :" -Foregroundcolor Red
        continue
    }
}     
exit 0

#########################################################################