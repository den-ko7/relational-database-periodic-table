#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"


if [[ -z "$1" ]]
then
#read ELEMENT
echo "Please provide an element as an argument."

elif [[ "$1" =~ ^[0-9]+$ ]]
then

 #echo "Searching Number"

 PICK_ELEMENT=$($PSQL "SELECT properties.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type_id FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number INNER JOIN types ON types.type_id = properties.type_id WHERE properties.atomic_number='$1'")
if [[ -z $PICK_ELEMENT ]]
then
echo "I could not find that element in the database."
else
echo "$PICK_ELEMENT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID
do
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done
fi # end of check $PICK_ELEMENT if statement

else

#echo "Searching Letters"
PICK_ELEMENT=$($PSQL "SELECT properties.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type_id FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number INNER JOIN types ON types.type_id = properties.type_id WHERE name='$1' OR symbol='$1'")
if [[ -z $PICK_ELEMENT ]]
then
echo "I could not find that element in the database."
else
echo "$PICK_ELEMENT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID
do
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done

fi # end of 2nd check $PICK_ELEMENT if statement


fi # end of first if statement



