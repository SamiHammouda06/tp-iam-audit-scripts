#!/ bin / bash
# Script d’ analyse des logs de sé curit é
# Auteur : Votre Nom

echo " ========================================== "
echo " ANALYSE DES LOGS DE SÉ CURIT É"
echo " ========================================== "
echo ""

echo " Derni è res connexions SSH ré ussies :"
sudo grep " Accepted " /var/log/auth.log | tail -n 10
echo ""
echo " Tentatives de connexion é chou ées (24 h):"
sudo grep " Failed password " /var/log/auth.log | grep "$( date+%b’ ’%d)" | wc -l
echo ""
echo " Commandes sudo exécut ées aujourd ’ hui :"
sudo grep " sudo .* COMMAND " /var/log/auth.log | grep "$( date +%b’’%d)"

echo ""
echo " ========================================== "
