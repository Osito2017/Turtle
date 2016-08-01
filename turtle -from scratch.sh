#this is Turtle (for personal use)
cat .copyright

#Making the project

read -p "Name of the project : " project && mkdir /home/osito/Desktop/Turtle/"$project" && mkdir -p /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/Preferences && mkdir -p /home/osito/Desktop/Turtle/"$project"/Library/Themes && mkdir -p /home/osito/Desktop/Turtle/"$project"/DEBIAN && touch /home/osito/Desktop/Turtle/"$project"/DEBIAN/control && mkdir -p /var/mobile/Library/iWidgets

#initializes the SpringBoard theme

read -p "$(tput setaf 2)SpringBoard Theme? : $(tput setaf 7)" n1 
if [[ -z "$n1" ]]; then 
	#echo "SpringBoard Theme Name: N/A" >> Theme.txt
	echo NO SpringBoard Theme
else	
	n1=$(eval echo "$n1")	
	cd $n1/	
	cp -ar "$n1" "/home/osito/Desktop/Turtle/"$project"/Library/Themes/"
	find $n1 -type f -printf "SpringBoard Theme Name: %h\n" >> Theme.txt
fi

#initializes the CC theme

read -p "$(tput setaf 3)Control Center Theme? : $(tput setaf 7)" n2
if [[ -z "$n2" ]]; then 
	echo "CC Theme Name: N/A" >> Theme.txt

#if there is input

else 
	n2=$(eval echo "$n2")	
	cd $n2/	
	cp -ar "$n2" "/home/osito/Desktop/Turtle/"$project"/Library/Themes/"
	find $n2 -type f -printf "CC Theme Name: %h\n" >> Theme.txt
fi

#initializes Messages theme (ie; masks to the bubbles, not the Messages Customiser settings. Thoses are in the Preferences.sh file ^-^) 

read -p "$(tput setaf 4)Messages Theme? : $(tput setaf 7)" n3
if [[ -z "$n3" ]]; then 
	echo "Messages Theme Name: N/A" >> Theme.txt

#if there is input

else 
	n3=$(eval echo "$n3")	
	cd $n3/	
	cp -ar "$n3" "/home/osito/Desktop/Turtle/"$project"/Library/Themes/"
	find $n3 -type f -printf "Messages Theme Name: %h\n" >> Theme.txt
fi

#initializes specific Lockscreen themes/widgets. It will give you an option to choose which theming engine you're using ^-^
while true; do
read -p "$(tput setaf 5)Lockscreen Theming Engine? G OR g for GroovyLock, C OR c for Cydget and L OR l LockHTML : $(tput setaf 7)" n4
    case $n4 in
        [Gg]* ) mkdir -p /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/GroovyLock/; break;;
        [Cc]* ) mkdir -p /home/osito/Desktop/Turtle/"$project"/System/Library/LockCydgets/; break;;
	[Ll]* ) mkdir -p /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/LockHTML/; break;;
	[Nn]* ) echo "Lockscreen Theme: NONE" >> Theme.txt break;;
        * ) echo "$(tput setaf 5)Please answer G OR g, C OR c , L OR l, N OR n";; 
    esac
done

#initializes Lockscreen Theme

read -p "$(tput setaf 6)Lockscreen Theme? : $(tput setaf 7)" n5
if [ -z "$n5" ]; then 
	echo "Lockscreen Theme Name: N/A" >> Theme.txt

#if GroovyLock is selected

elif [ -d /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/GroovyLock/ ] 
then
	n5=$(eval echo "$n5")	
	cd $n5/	
	cp -ar "$n5" "/home/osito/Desktop/Turtle/"$project"/var/mobile/Library/GroovyLock/" 2> error.txt	
	find $n5 -type f -printf "Lockscreen Theme Name: %h\n" >> Theme.txt

#if Cydget is selected
	
elif [ -d /home/osito/Desktop/Turtle/"$project"/System/Library/LockCydgets/ ] 
then
	n5=$(eval echo "$n5")	
	cd $n5/	
	cp -ar "$n5" "/home/osito/Desktop/Turtle/"$project"/System/Library/LockCydgets/" 2> error.txt	
	find $n5 -type f -printf "Lockscreen Theme Name: %h\n" >> Theme.txt

#if LockHTML is selected
	
elif [ -d /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/LockHTML/ ] 
then
	n5=$(eval echo "$n5")	
	cd $n5/	
	cp -ar "$n5" "/home/osito/Desktop/Turtle/"$project"/var/mobile/Library/LockHTML/" 2> error.txt	
	find $n5 -type f -printf "Lockscreen Theme Name: %h\n" >> Theme.txt

#just a place holder	
	
else
	echo error
fi

#initializes Preferences
read -p "$(tput setaf 8)Preferences? : $(tput setaf 7)" n6

if [[ -z "$n6" ]]; then 
	echo "Preference Files Used: N/A" >> Theme.txt
	echo "$(tput setaf 8)No preferences here"

#if there is input

else 
	n6=$(eval echo "$n6")	
	cd $n6/	
	cp -ar "$n6" "/home/osito/Desktop/Turtle/"$project"/var/mobile/Library/Preferences/" 2> error.txt
fi

#initializes which Bytafont you are using

while true; do
read -p "$(tput setaf 9)Bytafont version? (N OR n is None): $(tput setaf 7)" n7
	case $n7 in
		[2]* ) echo "Bytafont Version: 2" >> Theme.txt; mkdir -p /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/MyFonts2/; break;;
		[3]* ) echo "Bytafont Version: 3" >> Theme.txt; mkdir -p /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/Bytafont3/SwapMode/; break;;
		[Nn]* ) echo "Bytafont: NOT PRESENT" >> Theme.txt; break;;
		* ) echo "$(tput setaf 9)Please answer 2, 3 , N or n";; 
	esac
done

#initializes what font you're using
read -p "$(tput setaf 10)Font?: $(tput setaf 7)" n8

if [[ -z "$n8" ]]; then
	echo "Font used: NONE" >> Theme.txt
	echo "$(tput setaf 10)No Font used in this build"
	
elif [ -d /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/MyFonts2/ ]; then
	n8=$(eval echo "$n8")	
	cd $n8/	
	cp -ar "$n8" "/home/osito/Desktop/Turtle/"$project"/var/mobile/Library/MyFonts2/"	
	find $n8 -type f -printf "Font Used: %h\n" >> Theme.txt

elif [ -d /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/Bytafont3/SwapMode/ ]; then
	n8=$(eval echo "$n8")	
	cd $n8/	
	cp -ar "$n8" /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/Bytafont3/SwapMode/ 2> error.txt
	find $n8 -type f -printf "Font Used: %h\n" >> Theme.txt
else
	echo error
fi

#initializes iWidgets
read -p "$(tput setaf 11)iWidgets?: $(tput setaf 7)" n9

if [[ -z "$n9" ]]; then
	echo "iWidgets used: NONE" >> Theme.txt
	echo "$(tput setaf 11)No iWidgets used in this build"
else
	n9=$(eval echo "$n9")
	cd $n9/	
	cp -ar "$n9" /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/iWidgets/ 2> error.txt
	find $n9 -type f -printf "iWidgets used: %h\n" >> Theme.txt
fi

read -p "$(tput setaf 10)Respring Logo?: $(tput setaf 7)" n10

if [[ -z "$n10" ]]; then
	echo "$(tput setaf 7)No Respring Logo"
else
	n10=$(eval echo "$n10")
	cd $n10/	
	cp -ar "$n10" /home/osito/Desktop/Turtle/"$project"/var/mobile/Library/iWidgets/ 2> error.txt
fi

read -p "$(tput setaf 10)LockGlyph Theme?: $(tput setaf 7)" n11

if [[ -z "$n11" ]]; then
	echo "$(tput setaf 7)No LockGlyph Theme Used"
else
	n11=$(eval echo "$n11")
	cd $n11/
	cp -ar "$n11" /home/osito/Desktop/Turtle/"$project"/Library/"Application Support"/LockGlyph/Themes
fi

read -p "Passcode Buttons?: " n12

if [[ -z "$n12" ]]; then
	echo "$(tput setaf 7)No Passcode Buttons"
else
	n12=$(eval echo "$n12")
	cd $n12/
	cp -ar "$n12" /home/osito/Desktop/Turtle/"$project"/Library/Themes
fi

read -p "Control Center Toggles?: " n13

if [[ -z "$n13" ]]; then
	echo "$(tput setaf 7)No Control Center Toggles Theme"
else
	n13=$(eval echo "$n13")
	cd $n13/
	cp -ar "$n13" /home/osito/Desktop/Turtle/"$project"/Library/Themes
fi

read -p "Cellular Bars?: " n14

if [[ -z "$n14" ]]; then
	echo "No Cell Bars Theme"
else
	n14=$(eval echo "$n14")
	cd $n14/
	cp -ar "$n14" /home/osito/Desktop/Turtle/"$project"/Library/Themes
fi

read -p "Wifi Bars?: " n15

if [[ -z "$n15" ]]; then
	echo "No Wifi Bars Theme"
else
	n15=$(eval echo "$n15")
	cd $n15/
	cp -ar "$n15" /home/osito/Desktop/Turtle/"$project"/Library/Themes
fi

read -p "$(tput setaf 2)Package Name (lower case): $(tput setaf 7)" package && echo "Package: com.$author.$package" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
read -p "$(tput setaf 3)Name of package: $(tput setaf 7)" name && echo "Name: $name"  >>  /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
read -p "Depends: $(tput setaf 7)" depends && echo "Depends: mobilesubstrate (>= 0.9.5000), preferenceloader (>= 2.2.2), applist, $depends" >>  /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
read -p "$(tput setaf 4)Version: $(tput setaf 7)" version && echo "Version: $version" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
echo "Architecture: iphoneos-arm" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
read -p "$(tput setaf 11)Description: $(tput setaf 7)" description && echo "Description: $description" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
echo "Maintainer: Osito2017" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
echo "Author: Osito" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
echo "Section: Themes (Setup)" >> /home/osito/Desktop/Turtle/"$project"/DEBIAN/control
echo "$(tput setaf 7)Preparing $(tput setaf 9)$project $(tput setaf 7)for packaging"
dpkg-deb -b -Zgzip /home/osito/Desktop/Turtle/"$project" >> log.txt && rm log.txt
echo "$(tput setaf 9)$project $(tput setaf 7)finished its building phase"
cd /home/osito/Desktop/Turtle
cat .end
echo "$(tput setaf 7)Thanks for using Turtle :) "
