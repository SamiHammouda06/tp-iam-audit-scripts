#!/bin/bash
# Script d’audit des utilisateurs système
# Auteur : Votre Nom
# Date : $( date +%Y -%m -%d)
echo " ========================================== "
echo " AUDIT DES UTILISATEURS SYSTÈME"
echo " Date : $(date)"
echo " ========================================== "
echo ""
# Lister les utilisateurs avec UID >= 1000 ( utilisateurs normaux)
echo " Utilisateurs humains ( UID >= 1000) :"
awk -F: ’$3 >= 1000 && $3 < 65534 { print $1" ( UID :" $3 ") "} ’
/etc/passwd
echo ""
echo " Utilisateurs avec acc ès sudo :"
getent group sudo | cut -d: -f4
echo ""
echo " Comptes sans mot de passe ( RISQUE DE SÉ CURIT É):"
sudo awk -F: ’($2 == "" || $2 == "!") { print $1}’ /etc/shadow

echo ""
echo " Dernières connexions :"
last -n 10
echo ""
echo " ========================================== "
echo " FIN DE L’AUDIT"
echo " ========================================== "
