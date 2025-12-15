#########################################################################
# Script temp cpu
# Jouveaux Nicolas
# 15/12/2025
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
    Write-Host "Temperature CPU" -ForegroundColor Yellow
    Write-Host ""

    Write-Host " Verification des capteurs de temperature CPU" -ForegroundColor Yellow
    Write-Host ""

# Utilisation de la classe MSAcpi_ThermalZoneTemperature (souvent utilisée pour la température)
    try {
        $wmiTempKelvin = (Get-CimInstance -Namespace root/wmi -ClassName MSAcpi_ThermalZoneTemperature -ErrorAction Stop).CurrentTemperature
        
        if ($wmiTempKelvin) {
            # La température est retournée en Kelvin * 10. Conversion en Celsius.
            $tempCelsius = [math]::Round(($wmiTempKelvin / 10) - 273.15, 2)
            
            Write-Output "Temperature CPU (WMI) detectee :"
            Write-Output ""
            Write-Output "Temperature des zones thermiques : $($tempCelsius) °C"
        }
        else {
            Write-Host "WMI/CIM n'a pas pu détecter de temperature fiable." -ForegroundColor Red
        }
    }
    catch {
        Write-Host "Erreur WMI/CIM : Impossible de se connecter a la classe de temperature." -ForegroundColor Red
    }

Write-Host ""

# Save information
    save_info -label "Temperature CPU (WMI)" -value $tempCelsius
exit 0
#########################################################################