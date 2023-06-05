#!/bin/bash
# Script qui permet de kill les process sur un port donné, et de lancer un autre process.

# Veuillez etre root ou lancer le script avec sudo
# > Le premier paramètre est le numero de port
# > Le deuxieme parametre est le nom du service.

set -x

# Tue les process sur le port indiqué
kill $(lsof -t -i:$1)

sleep 1

# Run le service
systemctl start $2