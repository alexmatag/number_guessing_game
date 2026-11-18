#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# 1. Generar número aleatorio entre 1 y 1000
RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))

# 2. Pedir nombre de usuario
echo "Enter your username:"
read INPUT_USERNAME

# 3. Buscar si el jugador ya existe en la base de datos
PLAYER_ID_RESULT=$($PSQL "SELECT player_id FROM players WHERE username = '$INPUT_USERNAME';")

if [[ -z $PLAYER_ID_RESULT ]]
then
  # El jugador NO existe en la BD: es un nuevo jugador asi que lo registramos
  INSERT_NEW_PLAYER=$($PSQL "INSERT INTO players(username) VALUES('$INPUT_USERNAME');")
  # ¡CLAVE! Volvemos a consultar el ID del usuario para tenerlo en memoria ya que ID del usuario al ser un usuario nuevo este llega vacio y puede dar error al hacer el INSERT al insertar una variale vacia, dando un syntax error
  PLAYER_ID_RESULT=$($PSQL "SELECT player_id FROM players WHERE username = '$INPUT_USERNAME';")
  echo "Welcome, $INPUT_USERNAME! It looks like this is your first time here."
else
  # El jugador ya existe en la BD: entonces obtenemos sus partidas jugadas y su menor cantidad de tiros/juegos (el mejor intento antes de acercar el número)
  PLAYER_GAMES_COUNT=$($PSQL "SELECT COUNT(*) FROM games WHERE player_id = $PLAYER_ID_RESULT;")
  PLAYER_BEST_ATTEMPT=$($PSQL "SELECT MIN(tries) FROM games WHERE player_id = $PLAYER_ID_RESULT;")
  echo "Welcome back, $INPUT_USERNAME! You have played $PLAYER_GAMES_COUNT games, and your best game took $PLAYER_BEST_ATTEMPT guesses."
fi

echo "Guess the secret number between 1 and 1000:"
USER_ATTEMPTS=0

while true
do
  read INPUT_NUMBER
  ((USER_ATTEMPTS++))

  # 1. Validamos que el dato ingresado por el usuario sea un número entero positivo
  if [[ ! $INPUT_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  
  # 2. Si el número es MAYOR al objetivo, la respuesta es MENOR
  elif [[ $INPUT_NUMBER -gt $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"

  # 3. Si el número ingresado es MENOR al objetivo, la respuesta es MAYOR
  elif [[ $INPUT_NUMBER -lt $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"

  # 4. Si no es mayor ni menor, entonces es el número correcto
  else
    echo "You guessed it in $USER_ATTEMPTS tries. The secret number was $RANDOM_NUMBER. Nice job!"
    break
  fi
done

# Registramos la partida en la tabla de "games"
SAVE_GAME=$($PSQL "INSERT INTO games(player_id, tries) VALUES($PLAYER_ID_RESULT ,$USER_ATTEMPTS);")
