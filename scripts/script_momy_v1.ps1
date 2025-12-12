#########################################################################
# Script Momy V.1                                                       #
# Jouveaux Nicolas                                                      #
# 10/12/2025                                                            #
#########################################################################

#########################################################################
#                              Variable                                 #
#########################################################################


# Display the main menu
function menu {
    Clear-Host
    while ($true) {
        Write-Host "Machine : $env:COMPUTERNAME" -ForegroundColor Green
        Write-Host "Menu :" -ForegroundColor Yellow
        Write-Host "1) Utilisateur"
        Write-Host "2) Ordinateur"
        Write-Host "3) Sortie"
        $choice = Read-Host "Votre choix"
    
# User choice for main menu        
        switch ($choice) {
            1 { menu_user }
            2 { menu_desktop }
            3 { Write-Output "Sortie du script"
                return 
            }
            default { Write-Output "Erreur" }
        }
    }
}
# Display the user menu
function menu_user {
    Clear-Host
    while ($true) {
        Write-Host "Machine : $env:COMPUTERNAME" -ForegroundColor Green
        Write-Host "Menu utilisateur :" -ForegroundColor Yellow
        Write-Host "1) Action"
        Write-Host "2) Information"
        Write-Host "3) Retour"
        Write-Host "4) Exit"
        $choice2 = Read-Host "Votre choix"


# User choice for user menu
        switch ($choice2) { 
            1 { menu_user_action }
            2 { menu_user_information }
            3 { Write-Output "Retour"
                    Clear-Host 
                    return
            }
            4 { Write-Output "Exit - FIN DE SCRIPT"
                    exit 0
            }
            default { Write-Output "Erreur" }
        }
    }
}

# Display the desktop menu
function menu_desktop {
    Clear-Host
    while ($true) {
        Write-Host "Machine : $env:COMPUTERNAME" -ForegroundColor Green
        Write-Host "Menu ordinateur :" -ForegroundColor Yellow
        Write-Host "1) Action"
        Write-Host "2) Information"
        Write-Host "3) Retour"
        Write-Host "4) Exit"
        $choice2 = Read-Host "Votre choix"

# User choice for desktop menu
        switch ($choice2) {
            1 { menu_desktop_action }
            2 { menu_desktop_information }
            3 { Write-Output "Retour"
                Clear-Host
                return
            }
            4 { Write-Output "Exit - FIN DE SCRIPT"
                exit 0
            }
            default { Write-Output "Erreur" }
        }
    }
}

# Display the user action menu
function menu_user_action {
    Clear-Host
    while ($true) {
        Write-Host "Machine : $env:COMPUTERNAME" -ForegroundColor Green
        Write-Host "Menu action utilisateur :" -ForegroundColor Yellow
        Write-Host "1) Creation de compte utilisateur local"
        Write-Host "2) Changement de mot de passe"
        Write-Host "3) Suppression de compte utilisateur local"
        Write-Host "4) Ajout a un groupe d'administration"
        Write-Host "5) Ajout a un groupe"
        Write-Host "6) Retour"
        Write-Host "7) Exit"
        $choice3 = Read-Host "Votre choix"

# User choice for user action menu

        switch ($choice3) {
            1 { Clear-Host
                Write-Host "1" }
            2 { Write-Host "2" }
            3 { Write-Host "3" }
            4 { Write-Host "4" }
            5 { Write-Host "5" }
            6 { Write-Output "Retour"
                Clear-Host
                return
            }
            7 { Write-Output "Exit - FINI DE SCRIPT"
                exit 0
            }
            default { Write-Output "Erreur" }
        }
    } 
}

# Display the user information menu
function menu_user_information {
    Clear-Host
    while ($true) {
        Write-Host "Machine : $env:COMPUTERNAME" -ForegroundColor Green
        Write-Host "Menu information utilisateur :" -ForegroundColor Yellow
        Write-Host "1) Droits/permissions de l'utilisateur sur un dossier"
        Write-Host "2) Recherche des evenements dans le fichier log_evt.log pour un utilisateur"
        Write-Host "3) Retour"
        Write-Host "4) Exit"
        $choice3 = Read-Host "Votre choix"


# User choice for user information menu
        switch ($choice3) {
            1 { Clear-Host
                Write-Host "1" }
            2 { Write-Host "2" }
            3 { Write-Output "Retour"
                Clear-Host
                return
            }
            4 { Write-Output "Exit - FINI DE SCRIPT"
                exit 0
            }
            default { Write-Output "Erreur" }
        }
    }
}

# Display the desktop action menu
function menu_desktop_action {
    Clear-Host
        while ($true) {
        Write-Host "Machine : $env:COMPUTERNAME" -ForegroundColor Green
        Write-Host "Menu action ordinateur :" -ForegroundColor Yellow
        Write-Host "1) Verrouillage"
        Write-Host "2) Redemarrage"
        Write-Host "3) Activation du pare-feu"
        Write-Host "4) Creation de repertoire"
        Write-Host "5) Suppression de repertoire"
        Write-Host "6) Prise en main à distance (CLI)"
        Write-Host "7) Retour"
        Write-Host "8) Exit"
        $choice3 = Read-Host "Votre choix"

# User choice for desktop action menu
        switch ($choice3) {
            1 { Clear-Host
                Write-Host "1" }
            2 { Write-Host "2" }
            3 { Write-Host "3" }
            4 { Write-Host "4" }
            5 { Write-Host "5" }
            6 { Write-Host "6" }
            7 { Write-Output "Retour"
                Clear-Host
                return
            }
            8 { Write-Output "Exit - FINI DE SCRIPT"
                exit 0
            }
            default { Write-Output "Erreur" }
        }
    }
}

# Display the desktop information menu
function menu_desktop_information {
    Clear-Host
        while ($true) {
            Write-Host "Machine : $env:COMPUTERNAME" -ForegroundColor Green
            Write-Host "Menu information ordinateur :" -ForegroundColor Yellow
            Write-Host "1) Adresse IP, masque de sous-reseau et passerelle"
            Write-Host "2) Version de l'OS"
            Write-Host "3) Carte graphique"
            Write-Host "4) CPU % d'utilisation"
            Write-Host "5) Temperature du CPU"
            Write-Host "6) Uptime"
            Write-Host "7) Nombre de disques"
            Write-Host "8) Espace disque restant par partition/volume"
            Write-Host "9) Partitions (nombre, nom, FS, taille par disque)"
            Write-Host "10) Liste des utilisateurs locaux"
            Write-Host "11) 5 dernierse logins"
            Write-Host "12) 10 derniers evenements critiques"
            Write-Host "13) Recherche des évenements dans le fichier log_evt.log pour un ordinateur"
            Write-Host "14) Retour"
            Write-Host "15) Exit"
            $choice3 = Read-Host "Votre choix :"

# User choice for desktop information menu
            switch ($choice3) {
                1 { Clear-Host
                    Write-Host "1" }
                2 { Write-Host "2" }
                3 { Write-Host "3" }
                4 { Write-Host "4" }
                5 { Write-Host "5" }
                6 { Write-Host "6" }
                7 { Write-Host "7" }
                8 { Write-Host "8" }
                9 { Write-Host "9" }
                10 { Write-Host "10" }
                11 { Write-Host "11" }
                12 { Write-Host "12" }
                13 { Write-Host "13" }
                14 { Write-Output "Retour"
                    Clear-Host
                    return
                }
                15 { Write-Output "Exit - FINI DE SCRIPT"
                    exit 0
                }
                default { Write-Output "Erreur" }
        }
    }
}
menu