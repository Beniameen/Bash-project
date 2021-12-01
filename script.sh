#Student Name= Margret Beniameen
#Student ID= 10474901

#!/bin/bash

#Wget options that I have used
# -q -quiet to Turn off Wget’s output, show-progress is to force wget to display the progress bar in any verbosity.
#-nd no-directories Do not create a hierarchy of directories when retrieving recursively. 
#> /dev/null 2>&1 (ignore output and errors), -p Set directory prefix to prefix to Save Files in Specified Directory
#-e robots=off: do not follow robot.txt exclusion, -H option to turns on host spanning,

source codes.sh  #import code from another file that contain colours code variable

#while true is used here to keep prompt the user until they get it right
 
while true; do

# print all the thumbnail images in ECU media Media Gallery page to the screen

echo  -e "{ ${YELLOW}These are all the 75 thumbnail images in ECU Media Gallery Page 
 "DSC01533" , "DSC01536" , "DSC01543" , "DSC01558" , "DSC01565" , "DSC01566" , "DSC01569" , 
 "DSC01576" , "DSC01578" , "DSC01595" , "DSC01601" , "DSC01604" , "DSC01607" , "DSC01624" , 
 "DSC01625" , "DSC01629" , "DSC01656" , "DSC01657" , "DSC01663" , "DSC01667" , "DSC01675" , 
 "DSC01687" , "DSC01688" , "DSC01692" , "DSC01693" , "DSC01695" , "DSC01706" , "DSC01729" , 
 "DSC01732" , "DSC01740" , "DSC01746" , "DSC01752" , "DSC01758" , "DSC01761" , "DSC01766" , 
 "DSC01780" , "DSC01789" , "DSC01794" , "DSC01799" , "DSC01816" , "DSC01832" , "DSC01834" , 
 "DSC01843" , "DSC01857" , "DSC01864" , "DSC01871" , "DSC01873" , "DSC01881" , "DSC01883" ,
 "DSC01837" , "DSC01886" , "DSC01891" , "DSC01904" , "DSC01906" , "DSC01909" , "DSC01912" , 
 "DSC01914" , "DSC01919" , "DSC01920" , "DSC01921" , "DSC01960" , "DSC01961" , "DSC01983" , 
 "DSC01985" , "DSC01988" , "DSC01992" , "DSC01997" , "DSC02004" , "DSC02007" , "DSC02019" , 
 "DSC02028" , "DSC02030" , "DSC02032" , "DSC02038" , "DSC02042" ${NCOL}}"


#This is the ECU website ( Media Gallery page pertaining to the School of Science’s Cyber security courses ) assigned to a variable called url

url="https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152"

# prompt user to choose which option to download by entering number 1 or 2 or 3 or 4 and then save user input in variable calle "answer"

read -p  " if you want to	Download a specific thumbnail enter (1), Download ALL thumbnails enter (2), Download images in a specific 
   range enter (3), Download a random numbers of images in the specified range of DSC01533 to DSC02042  (4)  : " answer  

    #if the user input is equal to number 1, ask him to enter his chosen thumbnail number to be downloaded and save his input in variable called pic

    if [ $answer == 1 ]; then

      #another while true is used here to keep prompt the user until they get it right 

      while true; do

       read -p  " Please enter a thumbnail number ie DSC01566 from the above thumbnails to be downloaded: " image

       #Add the user input to the end of gallery website and before a .jpg and save in a variable called url1   
       url1="https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/$image.jpg"

        # curl the ecu gallery website to check that the thumbail name which the user enter is exist in the gallery website and ignore any errors
        #if it exists print downloading and the namme of the folder where it downloaded, thumbail name and file name
        # grep -w only find the exact match

         if curl -s https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152 | grep  -q -w "$image.jpg"   > /dev/null 2>&1   ; then 
           echo -e "${GREEN}Downloading $image ,  in folder name (Image), with the file name $image.jpg${NCOL}"
         
        # download the thumbail using wget and in foldername Thumbnail and only show the the progress bar which is only useful information in the output
        #sed is used to replace these  characters from the output by space and awk print text and variable (10) then break

         wget -P  Image/ -q --show-progress --progress=bar:force 2>&1 t $url1  | sed -u -e "s/[=/><]/ /g" | awk '{print " with a file size of " ,($10),"B....File Download Complete\n PROGRAM FINISHED" }' 
         break

        # if the user didn't put a valid thumbnail name print Please enter a valid thumbnail name
         else
          echo -e "${RED}Please enter a valid thumbnail name${NCOL} "
         fi
         done

        #another while true is used here to keep prompt the user until they get it right 

        while true; do

          # ask the user if he wants to play again by entering  y or n then save his input in variable called answer1
          #if answer1 is yY then break the loop and user will play again, if no exit and end game or if it is not y or n print please enter y or n

          read -p 'Do you want to play again, if yes please enter "y" or if no please enter "n": '  answer1
            
             case $answer1 in
              [Yy] ) 
            break
               ;;

              [Nn] ) 
              echo -e "${YELLOW}Thanks for your time :)${NCOL}"
              exit
              ;;
              *)
               echo -e "${RED}Please enter y or n ${NCOL} "
               
            esac
            done
    
    #if the user input equal to number 2 print all thumbnails in folder called all_thumbnails, only show the progress bar from the ouput
    #sed  will replace all the mentioned characters with space , then awk will print text and variable (7) and (10) 
    #then sed will delete the first two lines, finally print program finished.

    elif [ $answer == 2 ]; then
      echo -e "${GREEN}Downloading....in a folder name (All_Images)    ${NCOL}" 
      wget  -nd -H -p -q --show-progress --progress=bar:force 2>&1  -P All_Images/  -A jpg,jpeg,png,gif -e robots=off $url | sed -u -e "s/[=/><]/ /g" | awk '{print  ($7),", with a file size of " , ($10), "....File Download Complete" }' | sed '1,2d'
      echo -e "${GREEN}PROGRAM FINISHED${NCOL}" 

        #another while true is used here to keep prompt the user until they get it right 
        while true; do

        # ask the user if he wants to play again by entering   y or n  then save his input in variable called answer1
          #if answer1 is yY then break the loop and user will play again, if no exit and end game or if answer1 is not y or n print please enter y or n

          read -p 'Do you want to play again if yes please enter "y" or if no please enter "n" : '  answer1
            
             case $answer1 in
              [Yy] ) 
            break
               ;;

              [Nn] ) 
              echo -e "${YELLOW}Thanks for your time :)${NCOL}"
              exit
              ;;
              *)
               echo -e "${RED}Please enter y or n ${NCOL} "
               
            esac
            done
    
    #if user input is 3 then print enter range by the last 4 digits,then ask user for input
    #for the start range save input as var1 and for the end range save input as var2

    elif [ $answer == 3 ]; then

     #another while true is used here to keep prompt the user until they get it right 
     while true; do

      echo -e "${BLUE}please enter the range (by the last 4 digits of the file name), as an example, starting range of 1558 and ending range of 1569${NCOL}"
      #echo -e "${RED}Please be aware that images from start range and end${NCOL}"

      read -p " enter a start range  " var1
      read -p " enter a end range " var2
        
        #if start range is equal to or greater than 1533 which is the last four digit to my first thumbnail in the range and less than the last 4 digit of my last thumbnail in the range
        #end range is greater than 1533 and less than or equal to 2042 which is last 4 digit in the range
        #then print downloading in folder name (Thumbnails_Range) 

        if [[ "$var1"  -ge 1533 &&  "$var1" -lt 2042 ]] > /dev/null 2>&1 &&   [[ "$var2"  -gt 1533 &&  "$var2" -le 2042 ]] > /dev/null 2>&1; then
          
          echo -e "${GREEN}Downloading ..... in folder name (Images_Range)${NCOL}" 

          #C style loop is used here, and each time the loop repeats, i will go up by one.for i equal to var1 which start range and i equal to or less than var2
          #then download images by replacing the last four didgit of the image name in the url with the (i)
          #sed  will replace all the mentioned characters with space , then awk will print text and variable (7) and (10) 
          #Then break and print program finished, if  the range is incorrect or user put any characters print please choose range betweem 1533-2042.
          
          for ((i=$var1; i<=$var2; i++)); do 
             
             wget -nd -H  -q --show-progress --progress=bar:force 2>&1  -P Images_Range/  -A jpg,jpeg,png,gif -e robots=off https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC0$i.jpg | sed -u -e "s/[=/><]/ /g" | awk '{print  ($7)," , with a file size of " , ($10), "....File Download Complete" }'
        
          done 
          echo -e "${GREEN}PROGRAM FINISHED${NCOL}"
          
        break
        
        else
           echo -e "${RED}Invalid Range please choose range between 1533-2042${NCOL}"
        fi
        done
        

       #another while true is used here to keep prompt the user until they get it right

        while true; do

        # ask the user if he wants to play again by entering y or n then save his input in variable called answer1
        #if answer1 is yY then break and user will play again, if no exit and end game or if it is not y or n print please enter y or n
      
          read -p 'Do you want to play again , please enter "y" or "n" : '  answer1
            
             case $answer1 in
              [Yy] ) 
            break
               ;;

              [Nn] ) 
              echo -e "${YELLOW}Thanks for your time :)${NCOL}"
              exit
              ;;
              *)
               echo -e "${RED}Please enter y or n ${NCOL} "
               
            esac
            done
    
    #if user input is number 4 then prompt him to choose how many random images from the specified range of DSC01533 to DSC02042 will be downloaded
    
    elif [ $answer == 4 ]; then 

      #another while true is used here to keep prompt the user until they get it right

      while true; do
       
        read -p "Please enter how many random images in the specified range of DSC01533 to DSC02042 will be downloaded " number
          counter=0  # counter is set to 0

        # if user didn't put integer then print please enter integer only
        if ! [[ "$number" =~ ^[0-9]+$ ]]; then

         echo -e "${RED}Please enter integer only${NCOL}"
        
        #if the user enter a number more than 75 which is the total number of the available images in the gallery then print it is larger than range 
        elif  [ $number -gt 75 ]; then

         echo -e "${RED}The random number is larger than the numbers of images exist${NCOL}"
        
        #if the user enter number in the range then print downloading in folder name random_Thumbnails
        else
         echo -e "${GREEN}Downloading.... in folder name (random_Images)${NCOL}" 
        
        #for i equal to 0 and less than 510, try 510 times (large numbers of loop to make sure it keeps looping till it find the required number of images) I tried many times to ask for random images up to 75 and the code was able every time to give me the required number of random images
        #MyNum variable is to get random number in range 1532 till 2043 (it is larger than the existing range) 
        #but just to make sure it gets all the required number of random images from that the userenter because many of the random numbers will be invalid
        #that doesn't really matter because only the random number that grep will find in the website garlley will wget print it 
        #sed  will replace all the mentioned characteres with space , then awk will print text and variable (7) and (10) 
        # ((counter ++ ))to increment the counter, it will go up by one with each image download 

         for ((i=0; i<510; i++))  do
         MyNum=$(( $RANDOM % 509 + 1533))
         
          
          if  curl -s https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152 | grep  -q -w "DSC0$MyNum.jpg" > /dev/null 2>&1  ; then
          wget -nd  -H -p -q --show-progress --progress=bar:force 2>&1  -P  random_Images/  -A jpg,jpeg,png,gif -e robots=off https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC0$MyNum.jpg  | sed -u -e "s/[=/><]/ /g" | awk '{print  ($7),", with a file size of " , ($10), "....File Download Complete" }'
            (( counter++ )) 
          fi

          #when the counter of the downloaded images reach the number of random numbers that user enter then print program finished                                                                                                                                                                                                                                                                                                         
          
          if  [[ "$counter" -eq $number ]] ; then
            echo -e "${GREEN}PROGRAM FINISHED${NCOL}" 
        # ask the user if he want to play again and enter y or n then save his input in variable called answer1
            #if answer1 is yY then break and user will play again, if no exit and end game or if it is not y or n print please enter y or n
     
            while true; do
             
          read -p 'Do you want to play again if yes please enter "y" or  "no"  : '  answer1
            
            #break n (3) statement is used to break out of nested loop means loop within loop.
            
             case $answer1 in
              [Yy] )
              break 3
               ;;

              [Nn] ) 
              echo -e "${YELLOW}Thanks for your time :)${NCOL}"
              exit
              ;;
              *)
               echo -e "${RED}Please enter y or n ${NCOL} "
               
            esac
      done 
            
          fi
          done
      fi
   done

        
  #if the user didn't enter 1 or 2 or 3 or 4 then print Please choose 1 or 2 or 3 or 4
  else
    echo -e "${RED}Please choose 1 or 2 or 3 or 4${NCOL} "
  fi
done 
  
