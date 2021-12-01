#Student Name: Margret Beniameen
#Student ID: 10474901

#!/bin/bash
source codes.sh  #import code from another file that contain colours code variable
counter=0   # set counter to 0

# $RANDOM is used to choose a random number between 20 and 70 and it assigned to a variable called MyNum

MyNum=$(( $RANDOM % 50 + 20))

#echo "$MyNum"

#while true is used here to keep prompt the user until they get it right
while true; do

(( counter++ )) #increment the counter every time the while loop repeats

#promt user to enter a number, then I put this information to a variable 'answer'

read -p  'Guess AGE between 20 and 70: '  answer

# if .. elif..else  is used here so if you want to select one of many blocks of code to execute. It checks expression 1, 
#if it is true executes statement 1 and break. If expression 1 is false, it checks expression 2, and if all the expression is false, 
#then it enters into else block and executes the statements in the else block.

    #if the user answer is integer and equal to the randomly generated number then print a message in green colour  says it's correct answer 
    #and how many attempts used 
    #2>/dev/null is used to make sure only integer number is accepted 

    if [ $answer -eq $MyNum 2>/dev/null ]; then
        echo -e "${GREEN}your guess is correct and you did it after $counter attempts ${NCOL} "

    # another while loop is used here to re prompt the user if he wants to play again 
        while true; do
        
            read -p 'Do you want to play again: ' answer2
            # if the variable answr2 is 'y' then the counter will start gain and another number will be generated
            #if answer2 is n then the test will exit and if neither y or n then the user will be re asked to please answer y or n
            case $answer2 in
              [Yy] ) 
            counter=0
            MyNum=$(( $RANDOM % 50 + 20))
            #echo "$MyNum"
        
            break
               ;;

              [Nn] ) 
              echo -e "${YELLOW}Thanks for your time :)${NCOL}"
              exit
              ;;
              *)
               echo "please answer y or n"::
            esac
        done

#if answer is integer and  greater than the randomly generated number then print out guess is high 
    elif [ $answer -gt $MyNum 2>/dev/null ]; then
        echo -e "${BLUE}your guess is too high${NCOL}"

#if answer is integer and  greater than the randomly generated number then print out guess is low
    elif [ $answer -lt $MyNum 2>/dev/null ]; then
        echo -e "${BLUE}your guess is too low${NCOL}"
        
# if the user didn't enter integer and enter any invalid data then print invalid message in red colour
    else
        echo -e "${RED}Invalid entery${NCOL}"
    fi
 
done


