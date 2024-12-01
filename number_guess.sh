#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RUN() {
  RANDOM_NUMBER=$((1+RANDOM%1000))
  echo $RANDOM_NUMBER

  echo "Enter your username:"
  read USERNAME

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  USER_LOGIC $USER_ID
  
  echo -e "\nGuess the secret number between 1 and 1000:"
  GUESS=0
  NUMBER_OF_GUESSES=0

  while [ $RANDOM_NUMBER -ne $GUESS ]
  do
    read GUESS
    ((++NUMBER_OF_GUESSES))
    if [[ $GUESS =~ '^[0-9]+$' ]]
    then
      echo That is not an integer, guess again:
      GUESS=0
    elif [[ $GUESS =~ [a-zA-Z] ]]
    then
      echo That is not an integer, guess again:
      GUESS=0
    elif [[ $GUESS > $RANDOM_NUMBER ]]
    then
      echo It\'s lower than that, guess again:
    elif [[ $GUESS < $RANDOM_NUMBER ]]
    then
      echo It\'s higher  than that, guess again:
    elif [[ $GUESS == $RANDOM_NUMBER ]]
    then
      echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!
    else
      echo That is not an integer, guess again:
      GUESS=0
    fi
  done

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  PLAYS_INSERT_RESULT=$($PSQL "INSERT INTO plays(number_of_guesses,user_id) VALUES($NUMBER_OF_GUESSES,$USER_ID)")
}
USER_LOGIC() {
  if [[ -z $1 ]] 
  then
    USERNAME_INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  else 
    USERNAME_PLAYS=$($PSQL "SELECT COUNT(*) number_of_games_played, MIN(number_of_guesses) as number_of_guesses FROM plays FULL JOIN users USING(user_id) WHERE username='$USERNAME' GROUP BY user_id")
    echo $USERNAME_PLAYS | while IFS='|' read NUMBER_OF_GAMES_PLAYED NUMBER_OF_GUESSES
    do
      # if [[ $NUMBER_OF_GAMES_PLAYED -le 1 ]]
      # then
      #   echo -e "Welcome back, $(echo $USERNAME | sed -E 's/^ *| *$//g')! You have played $(echo $NUMBER_OF_GAMES_PLAYED | sed -E 's/^ *| *$//g') game, and your best game took $(echo $NUMBER_OF_GUESSES | sed -E 's/^ *| *$//g') guesses."
      # else 
        echo -e "Welcome back, $(echo $USERNAME | sed -E 's/^ *| *$//g')! You have played $(echo $NUMBER_OF_GAMES_PLAYED | sed -E 's/^ *| *$//g') games, and your best game took $(echo $NUMBER_OF_GUESSES | sed -E 's/^ *| *$//g') guesses."
      # fi
    done
  fi
}
RUN