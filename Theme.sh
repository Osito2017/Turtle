#Deals with theme management

#initializes Springboard theme
echo "Drag and Drop is supported :)"
#space
#space
read -p "What SpringBoard theme will you be using and give the location of the file : " n1 
find $n1 -type f -printf "SpringBoard Theme name: %f\n" >> Theme.txt
cp $n1 /home/osito/Desktop/Turtle/Input/Themes/SpringBoard/ 2> error.txt
#intializes CC Theme
read -p "What Control Center theme will you be using and give the location of the file : " n2
find $n2 -type f -printf "CC Theme name: %f\n" >> Theme.txt
cp $n2 /home/osito/Desktop/Turtle/Input/Themes/CC 2> error.txt
#initializes Messages theme
read -p "What Messages theme will you be using and give the location of the file : " n3
find $n3 -type f -printf "Messages Theme name: %f\n" >> Theme.txt
cp $n3 /home/osito/Desktop/Turtle/Input/Themes/Messages 2> error.txt
#initializes Lockscreen theme
read -p "What Lockscreen theme will you be using and give the location of the file : " n4
find $n4 -type f -printf "Lockscreen Theme name: %f\n" >> Theme.txt
cp $n4 /home/osito/Desktop/Turtle/Input/Themes/Messages 2> error.txt
#initializes Media Controls theme
read -p "What Media Controls theme will you be using and give the location of the file : " n5
find $n5 -type f -printf "Lockscreen Theme name: %f\n" >> Theme.txt
cp $n5 /home/osito/Desktop/Turtle/Input/Themes/MediaControls 2> error.txt
rm error.txt
#end of fun. Here's a turtle
cat .Turtle
echo "Thanks for using Turtle :) "
