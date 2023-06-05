#!/bin/bash
# Simple jeu Pierre-Feuille-Ciseaux en 1 manche

# Les actions possibles
game_action=("Pierre" "Feuille" "Ciseaux")

echo "Vous allez jouer une partie de Pierre-Feuille-Ciseaux en 1 manche"
echo "1. Pierre"
echo "2. Feuille"
echo "3. Ciseaux"
read -p "Veuillez choisir votre action en tapant le nombre correspondant a votre action, puis [ENTER] : " userInput #Recupère l'input de l'utilisateur

# Check l'input de l'utilisateur
re='^[0-9]+$'
if ! [[ $userInput =~ $re ]] || [[ $userInput -lt 1 ]] || [[ $userInput -gt 3 ]]; then
    echo "Votre action '$userInput' est introuvable."
    exit 0
fi


# Génère une valeur random pour l'adversaire
botValue=$(( $RANDOM % 3 ))

# Reduit de 1 la valeur de l'user
userInput=$((userInput - 1))

echo ""
echo "Votre action : ${game_action[$userInput]}"
echo "Action de l'adversaire : ${game_action[$botValue]}"
echo ""

if [[ $userInput -eq $botValue ]]; then
    echo "Égalité !"
elif [[ ($userInput -gt $botValue) || ($userInput -eq 2 && $botValue -eq 0) ]]; then
    echo "Défaite !"
else
    echo "Victoire !"
fi

exit 0