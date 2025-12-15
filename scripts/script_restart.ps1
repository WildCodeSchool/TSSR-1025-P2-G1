#########################################################################
# Script for restart computer
# Paisant Franck
# 04/12/2025
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


$countdown=5
$machine=$info_target


#########################################################################
# Script
#########################################################################

# menu name display
    Write-Host "restart $info_target" -ForegroundColor Yellow
    Write-Host ""

    Write-Host "Compte a rebours avant redemarrage de $machine" -ForegroundColor Yellow
    Write-Host ""

while ( $countdown -ne 0 ) {
    Write-Host "$countdown" -ForegroundColor Yellow
    $countdown--
    Start-Sleep -Seconds 1
}

Write-Host "Redemarrage de la $machine en cours  !!" -ForegroundColor Yellow
Start-Sleep -Seconds 1

shutdown /r /f /t 0

exit 0

