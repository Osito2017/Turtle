#this is when the transfer is complete and you throw it into Ubuntu
read -p "Name of project?: " project
read -p "Drop setup here: " setup
SETUP=$setup
echo "Location: $SETUP"
SETUP=$(eval echo "$SETUP")
if [[ -d "$SETUP/Library/Themes" ]]; then
	mkdir -p /home/osito/Desktop/"$project"/Library/Themes	
	find $SETUP/Library/Themes/ -maxdepth 1 | xargs -I {} cp -bR $SETUP/Library/Themes/*.theme /home/osito/Desktop/$project/Library/Themes 	
	echo "$(tput setaf 9)Themes $(tput setaf 7)finished copying"
	while true; do
	read -p "Are you running Winterboard?: " yn
		case $yn in
			[Yy]* ) cp -bR /home/osito/Desktop/Resources/IconBundles/MobileSubstrate /home/osito/Desktop/$project/Library; break;;
			[Nn]* ) echo "Not running Winterboard. Assuming user is running Anemone"; break;;
			[""]* ) echo "Please answer the question";;
		esac
	done
else
	echo "$(tput setaf 7)No $(tput setaf 9)Themes $(tput setaf 7)present"
fi

while true; do
read -p "Hide Icon Labels?: " iconlabels
	case $iconlabels in
		[Yy]* ) if [[ -d /home/osito/Desktop/$project/Library/DynamicLibraries ]]; then
					cp /home/osito/Desktop/Resources/HideLabels/MobileSubstrate/DynamicLibraries/HideLabels.dylib /home/osito/Desktop/$project/Library/MobileSubstrate/DynamicLibraries/
					cp /home/osito/Desktop/Resources/HideLabels/MobileSubstrate/DynamicLibraries/HideLabels.plist /home/osito/Desktop/$project/Library/MobileSubstrate/DynamicLibraries/
				else
					mkdir -p /home/osito/Desktop/$project/Library/MobileSubstrate/DynamicLibraries
					find /home/osito/Desktop/Resources/HideLabels/MobileSubstrate/DynamicLibraries -maxdepth 1 | xargs -I {} cp -bR /home/osito/Desktop/Resources/HideLabels/MobileSubstrate/DynamicLibraries/HideLabels.plist /home/osito/Desktop/$project/Library/MobileSubstrate/DynamicLibraries
					find /home/osito/Desktop/Resources/HideLabels/MobileSubstrate/DynamicLibraries -maxdepth 1 | xargs -I {} cp -bR /home/osito/Desktop/Resources/HideLabels/MobileSubstrate/DynamicLibraries/HideLabels.dylib /home/osito/Desktop/$project/Library/MobileSubstrate/DynamicLibraries
				fi
					
				mkdir -p /home/osito/Desktop/$project/Library/PreferenceBundles && mkdir -p /home/osito/Desktop/$project/Library/PreferenceLoader 
				find /home/osito/Desktop/Resources/HideLabels/PreferenceBundles -maxdepth 1 | xargs -I {} cp -bR /home/osito/Desktop/Resources/HideLabels/PreferenceBundles /home/osito/Desktop/$project/Library/PreferenceBundles 
				find /home/osito/Desktop/Resources/HideLabels/PreferenceLoader -maxdepth 1 | xargs -I {} cp -bR /home/osito/Desktop/Resources/HideLabels/PreferenceLoader  /home/osito/Desktop/$project/Library/PreferenceLoader/	
				break;;
		[Nn]* ) echo Not hiding labels; break;;
		[""]* ) Please answer the question;;
	esac
done

if [[ -d "$SETUP"/var/mobile/Library/Preferences ]]; then
	mkdir -p /home/osito/Desktop/"$project"/var/mobile/Library/Preferences
	find $SETUP/var/mobile/Library/Preferences -maxdepth 1 -type f | xargs -I {} cp {} /home/osito/Desktop/$project/var/mobile/Library/Preferences
	echo "$(tput setaf 9)Preferences $(tput setaf 7)finished copying"
else
	echo "$(tput setaf 7)No $(tput setaf 9)Preferences $(tput setaf 7)present"
fi

if [[ -d "$SETUP"/Library/Zeppelin ]]; then
	find $SETUP/Library/Zeppelin/ -maxdepth 1 | xargs -I {} cp -bR $SETUP/Library/Zeppelin /home/osito/Desktop/$project/Library
	echo "$(tput setaf 9)Zeppelin $(tput setaf 7)themes finished copying"
else
	echo "$(tput setaf 7)No $(tput setaf 9)Zeppelin $(tput setaf 7)themes present"
fi

if [[ -d "$SETUP"/Library/Alkaline ]]; then
	find $SETUP/Library/Alkaline/ -maxdepth 1 | xargs -I {} cp -bR $SETUP/Library/Alkaline /home/osito/Desktop/$project/Library
	echo "$(tput setaf 9)Alkaline $(tput setaf 7)themes finished copying"
else
	echo "$(tput setaf 7)No $(tput setaf 9)Alkaline $(tput setaf 7)themes present"
fi

if [[ -d "$SETUP"/var/mobile/Library/iWidgets ]]; then
	find $SETUP/var/mobile/Library/iWidgets -maxdepth 1 | xargs -I {} cp -bR $SETUP/var/mobile/Library/iWidgets /home/osito/Desktop/$project/var/mobile/Library
	echo "$(tput setaf 9)iWidgets $(tput setaf 7)finished copying"
else
	echo "$(tput setaf 7)No $(tput setaf 9)iWidgets $(tput setaf 7)present"
fi

if [[ -d "$SETUP"/var/mobile/Library/MyFonts2 ]]; then
	find $SETUP/var/mobile/Library/MyFonts2 -maxdepth 1 | xargs -I {} cp -bR $SETUP/var/mobile/Library/MyFonts2 /home/osito/Desktop/$project/var/mobile/Library
	echo "$(tput setaf 9)Fonts $(tput setaf 7)finished copying"
else 
	find $SETUP/var/mobile/Library/BytaFont3/SwapMode/ -maxdepth 1 | xargs -I {} cp -bR $SETUP/var/mobile/Library/BytaFont3 /home/osito/Desktop/$project/var/mobile/Library
	echo "$(tput setaf 9)Fonts $(tput setaf 7)finished copying"
fi
