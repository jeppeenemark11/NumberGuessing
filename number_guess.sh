#!/bin/bash

# Set up the psql command and database connection details
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate a random number between 1 and 1000
random_number=$((1 + RANDOM % 1000))
USERID="0"
# Ask for the username
echo "Enter your username:"
read username

if [[ ${#username} -le 22 ]]; then
    # Check if the user exists in the database
    NAME=$($PSQL "SELECT username FROM users WHERE username='$username'")

    if [[ -z $NAME ]]; then
        # If the user doesn't exist, insert their username into the 'users' table
        
        echo "Welcome, $username! It looks like this is your first time here."
$PSQL "INSERT INTO users(username) VALUES('$username')" >/dev/null 2>&1
USERID=$($PSQL "SELECT user_id FROM users WHERE username='$username'")
$PSQL "INSERT INTO games(user_id) VALUES($USERID)" >/dev/null 2>&1

    else
    USERID=$($PSQL "SELECT user_id FROM users WHERE username='$username'")
    GAMESPLAYED=$($PSQL "SELECT games_played FROM games WHERE user_id=$USERID")
    BESTGAME=$($PSQL "SELECT guesses FROM games WHERE user_id=$USERID")
        echo "Welcome back, '$username'! You have played $GAMESPLAYED games, and your best game took $BESTGAME guesses."
    fi
else
    echo "Username should be maximum 22 characters. Try again."
fi



##storedvals
GAMESIN=$($PSQL "SELECT games_played FROM games WHERE user_id=$USERID")
GAMESBEST=$($PSQL "SELECT guesses FROM games WHERE user_id=$USERID")
counter=0
BEFOREGAMES=0

#Guessing game
echo "Guess the secret number between 1 and 1000:"
NUMBER_GUESSER(){
read GUESS

#tries

((counter++)) 

#checks if its a number
if [[ $GUESS =~ ^[0-9]+$ ]]
 then

#Lower
if [[ $GUESS -gt $random_number ]]
then
echo "It's lower than that, guess again:"
NUMBER_GUESSER
fi

#higher
if [[ $GUESS -lt $random_number ]]
then
echo "It's higher than that, guess again:"
NUMBER_GUESSER
fi

#Equal
if [[ $GUESS -eq $random_number ]]
then

#update best game
if ! [[ $GAMESBEST -eq '0' ]] 
then
if [[ $counter -lt $GAMESBEST ]]
then
PS=$($PSQL "UPDATE games SET guesses = $counter WHERE user_id=$USERID");
fi
else 
PS=$($PSQL "UPDATE games SET guesses = $counter WHERE user_id=$USERID");
fi


#update games played
((BEFOREGAMES = GAMESIN + 1))
PS2=$($PSQL "UPDATE games SET games_played = $BEFOREGAMES WHERE user_id=$USERID");
echo "You guessed it in $counter tries. The secret number was $random_number. Nice job!"
return
fi

 else
 echo "That is not an integer, guess again:"
 NUMBER_GUESSER
fi
}
NUMBER_GUESSER

