#this is Turtle

#Making the project

read -p "Name of the project : " project && mkdir /home/osito/Desktop/Turtle/"$project" && mkdir -p /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/Preferences && mkdir -p /home/osito/Desktop/Turtle/"$project"/Library/Themes && mkdir -p /home/osito/Desktop/Turtle/"$project"/DEBIAN && touch /home/osito/Desktop/Turtle/"$project"/DEBIAN/control

#initializes the SpringBoard theme

read -p "What SpringBoard theme will you be using and give the location of the file : " n1 
if [[ -z "$n1" ]]; then 
	echo "SpringBoard Theme Name: N/A" >> Theme.txt

#if there is input

else 
	find $n1 -type f -printf "SpringBoard Theme Name: %f\n" >> Theme.txt
	mkdir -p /home/osito/Desktop/Turtle/"$project"/Library/Themes/
	cp $n1 /home/osito/Desktop/Turtle/"$project"/Library/Themes/ 2> error.txt
fi

#initializes the CC theme

read -p "What Control Center theme will you be using and give the location of the file : " n2
if [[ -z "$n2" ]]; then 
	echo "CC Theme Name: N/A" >> Theme.txt

#if there is input

else 
	find $n2 -type f -printf "CC Theme Name: %f\n" >> Theme.txt
	mkdir -p /home/osito/Desktop/Turtle/"$project"/Library/Themes/
	cp $n2 /home/osito/Desktop/Turtle/"$project"/Library/Themes/ 2> error.txt
fi

#initializes Messages theme (ie; masks to the bubbles, not the Messages Customiser settings. Thoses are in the Preferences.sh file ^-^) 

read -p "What Messages theme will you be using and give the location of the file : " n3
if [[ -z "$n3" ]]; then 
	echo "Messages Theme Name: N/A" >> Theme.txt

#if there is input

else 
	find $n3 -type f -printf "Messages Theme Name: %f\n" >> Theme.txt
	cp $n3 /home/osito/Desktop/Turtle/"$project"/Library/Themes/2> error.txt
fi

#initializes specific Lockscreen themes/widgets. It will give you an option to choose which theming engine you're using ^-^
while true; do
read -p "What Lockscreen theming engine are you using? G OR g is for GroovyLock, C OR c is for Cydget and L OR l is LockHTML : " n4
    case $n4 in
        [Gg]* ) mkdir -p /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/GroovyLock/; break;;
        [Cc]* ) mkdir -p /home/osito/Desktop/Turtle/"$project"/System/Library/LockCydgets/; break;;
		[Ll]* ) mkdir -p /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/LockHTML/; break;;
		[Nn]* ) echo "Lockscreen Theme: NONE" >> Theme.txt break;;
        * ) echo "Please answer G OR g, C OR c , L OR l, N OR n";; 
    esac
done

#initializes Lockscreen Theme

read -p "What Lockscreen theme will you be using and give the location of the file : " n5
if [ -z "$n5" ]; then 
	echo "Lockscreen Theme Name: N/A" >> Theme.txt

#if GroovyLock is selected

elif [ -d /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/GroovyLock/ ] 
then
	find $n5 -type f -printf "Lockscreen Theme Name: %f\n" >> Theme.txt;
	cp $n5 /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/GroovyLock/ 2> error.txt;

#if Cydget is selected
	
elif [ -d /home/osito/Desktop/Turtle/"$project"/System/Library/LockCydgets/ ] 
then
	find $n5 -type f -printf "Lockscreen Theme Name: %f\n" >> Theme.txt;
	cp $n5 /home/osito/Desktop/Turtle/"$project"/System/Library/LockCydgets/ 2> error.txt;

#if LockHTML is selected
	
elif [ -d /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/LockHTML/ ] 
then
	find $n5 -type f -printf "Lockscreen Theme Name: %f\n" >> Theme.txt;
	cp $n5 /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/LockHTML/ 2> error.txt;

#just a place holder	
	
else
	echo error
fi

#initializes Preferences
read -p "What Preferences will you be using and give the location of the folder : " n6

if [[ -z "$n6" ]]; then 
	echo "Preference Files Used: N/A" >> Theme.txt
	echo "No preferences here"

#if there is input

else 
	cp -r $n6 /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/Preferences/
fi
read -p "Author : " author && echo "Author: $author" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
read -p "Package Name (lower case): " package && echo "Package: com.$author.$package" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
echo "Name: $name" >>  /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
read -p "Depends: " depends && echo "Depends: mobilesubstrate (>= 0.9.5000), preferenceloader (>= 2.2.2), applist, $depends" >>  /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
read -p "Version: " version && echo "Version: $version" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
echo "Architecture: iphoneos-arm" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
read -p "Description: " $description && echo "Description: $description" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
read -p "Maintainer : " maintainer && echo "Maintainer: $maintainer" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
echo "Section: Themes (Setup)" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
#echo " " >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
echo "Preparing project for packaging"
dpkg-deb -b -Zgzip /home/osito/Desktop/Turtle/"$project" 2> log.txt && rm log.txt
echo "$project finished its building phase"
cat .Turtle
echo "Thanks for using Turtle :) "
