#this is a rewrite of B.bsh, the extractor for iOS. Code Name: Extractor
if [[ -d /var/mobile ]]; then
	read -p "Name of project?: " project
	mkdir -p /private/var/mobile/"$project"/Library/Themes
	mkdir -p /private/var/mobile/"$project"/var/mobile/Library/Preferences
	mkdir -p /private/var/mobile/"$project"/var/mobile/Library/SMS
	mkdir -p /private/var/mobile/"$project"/var/mobile/Library/SpringBoard && cp "/private/var/mobile/Library/SpringBoard/IconState.plist" "/private/var/mobile/"$project"/var/mobile/Library/SpringBoard"
	#copy the file "IconState.plist"....very interesting
	#check list
	#find $SETUP/Library/Themes/ -maxdepth 1 | xargs -I {} cp -bR $SETUP/Library/Themes/*.theme /home/osito/Desktop/$project/Library/Themes 
else
	echo error
fi

if [[ -s /private/var/mobile/Library/Preferences/com.fidele007.hotdogpref.plist ]]; then
	mkdir -p "/private/var/mobile/"$project"/var/mobile/Hotdog_Settings"
	find /private/var/mobile/Library/Preferences/com.fidele007.hotdogpref.plist -maxdepth 1 | xargs -I {} cp {} "/private/var/mobile/Library/Preferences/com.fidele007.hotdogpref.plist" "/private/var/mobile/"$project"/var/mobile/Hotdog_Settings"
else
	echo Hotdog Not Currently Installed
fi

if [[ -s /private/var/mobile/Library/Preferences/me.chewitt.MCPrefs.plist ]]; then
	mkdir -p "/private/var/mobile/"$project"/var/mobile/Messages_Customiser_Settings"
	find /private/var/mobile/Library/Preferences/me.chewitt.MCPrefs.plist -maxdepth 1 | xargs -I {} cp {} "/private/var/mobile/Library/Preferences/me.chewitt.MCPrefs.plist" "/private/var/mobile/"$project"/var/mobile/Messages_Customiser_Settings"
else
	echo Messages Customiser Not Currently Installed
fi

if [[ -s /private/var/mobile/Library/Preferences/com.thomasfinch.priorityhub.plist ]]; then
	mkdir -p "/private/var/mobile/"$project"/var/mobile/Priority_Hub_Settings"
	find /private/var/mobile/Library/Preferences/com.thomasfinch.priorityhub.plist -maxdepth 1 | xargs -I {} cp {} "/private/var/mobile/Library/Preferences/com.thomasfinch.priorityhub.plist" "/private/var/mobile/"$project"/var/mobile/Priority_Hub_Settings" 
else
	echo Priority Hub Not Currently Installed
fi

if [[ -s /private/var/mobile/Library/Preferences/me.qusic.couria.plist && -s /private/var/mobile/Library/Preferences/me.qusic.couria.data.plist ]]; then
	mkdir -p "/private/var/mobile/"$project"/var/mobile/Couria_Settings" #ADD support for Couria themes
	find /private/var/mobile/Library/Preferences/me.qusic.couria.plist -maxdepth 1 | xargs -I {} cp {} "/private/var/mobile/Library/Preferences/me.qusic.couria.plist" "/private/var/mobile/"$project"/var/mobile/Couria_Settings"
	find /private/var/mobile/Library/Preferences/me.qusic.couria.data.plist -maxdepth 1 | xargs -I {} cp {} "/private/var/mobile/Library/Preferences/me.qusic.couria.data.plist" "/private/var/mobile/"$project"/var/mobile/Couria_Settings"
 else
	echo Couria Not Currently Installed
fi

if [[ -s /private/var/mobile/Library/Preferences/jp.r-plus.DoubleCut.plist ]]; then
	mkdir -p "/private/var/mobile/"$project"/var/mobile/DoubleCut_Settings"
	find /private/var/mobile/Library/Preferences/jp.r-plus.DoubleCut.plist -maxdepth 1 | xargs -I {} cp {} "/private/var/mobile/Library/Preferences/jp.r-plus.DoubleCut.plist" "/private/var/mobile/"$project"/var/mobile/DoubleCut_Settings"
else
	echo DoubleCut Not Currently Installed
fi

if [[ -s /private/var/mobile/Library/Preferences/libactivator.plist || -s /private/var/mobile/Library/Preferences/libactivator.exported.plist ]]; then
	mkdir -p "/private/var/mobile/"$project"/var/mobile/Activator_Settings"
	find /private/var/mobile/Library/Preferences/libactivator.plist -maxdepth 1 | xargs -I {} cp {} "/private/var/mobile/Library/Preferences/libactivator.plist" "/private/var/mobile/"$project"/var/mobile/Activator_Settings"
	find /private/var/mobile/Library/Preferences/libactivator.exported.plist -maxdepth 1 | xargs -I {} cp {} "/private/var/mobile/Library/Preferences/libactivator.exported.plist" "/private/var/mobile/"$project"/var/mobile/Activator_Settings"
else
	echo Activator Not Currently Installed
fi

if [[ -s /private/var/mobile/Library/Preferences/com.saurik.WinterBoard.plist ]]; then
	mkdir -p "/private/var/mobile/"$project"/var/mobile/Winterboard_Settings"
	find /private/var/mobile/Library/Preferences/com.saurik.WinterBoard.plist -maxdepth 1 | xargs -I {} cp {} "/private/var/mobile/Library/Preferences/com.saurik.WinterBoard.plist" "/private/var/mobile/"$project"/var/mobile/Winterboard_Settings"
else
	echo WinterBoard Not Currently Installed
fi

#the actual copying process now begins

echo Starting copying process
cd /Library/Themes && cp -Lrf "/Library/Themes" "/private/var/mobile/"$project"/Library/Themes"
echo "SpringBoard Themes sucessfully transferred"

#transferring Zeppelin logos
if [[ -d /Library/Zeppelin && -s /var/mobile/Library/Preferences/com.alexzielenski.zeppelin.plist ]]; then
	mkdir -p "/private/var/mobile/"$project"/Library/Zeppelin"
	cp -Lrf "/Library/Zeppelin" "/private/var/mobile/"$project"/Library/Zeppelin"
	mkdir -p /private/var/mobile/"$project"/var/mobile/Zeppelin_Settings
	cp "/var/mobile/Library/Preferences/com.alexzielenski.zeppelin.plist" "/private/var/mobile/"$project"/var/mobile/Zeppelin_Settings"
	echo "Zeppelin Preferences and Themes sucessfully transferred"
else
	echo Zeppelin Not Currently Installed
fi

if [[ -s /private/var/mobile/Library/Preferences/com.fortysixandtwo.alkaline.plist || -d /Library/Alkaline ]]; then
	mkdir -p /private/var/mobile/"$project"/Library/Alkaline
	cp -rf "/Library/Alkaline" "/private/var/mobile/"$project"/Library/Alkaline"
	mkdir -p /private/var/mobile/"$project"/var/mobile/Alkaline_Settings
	cp /private/var/mobile/Library/Preferences/com.fortysixandtwo.alkaline.plist "/private/var/mobile/"$project"/var/mobile/Alkaline_Settings"
	echo Alkaline Themes and Settings sucessfully transferred
else
	echo Alkaline Not Currently Installed
fi

if [[ -d /private/var/mobile/Library/iWidgets ]]; then
	mkdir -p /private/var/mobile/"$project"/var/mobile/Library/iWidgets
	cp -rf "/private/var/mobile/Library/iWidgets" "/private/var/mobile/"$project"/var/mobile/Library/iWidgets"
	echo "iWidgets sucessfully transferred"
else
	echo "iWidgets not currently icon"
fi

if [[ -d /private/var/mobile/Library/GroovyLock ]]; then
	mkdir -p "/private/var/mobile/"$project"/var/mobile/Library/GroovyLock"
	cp -rf "/private/var/mobile/Library/GroovyLock" "/private/var/mobile/"$project"/var/mobile/Library/GroovyLock"
	echo GroovyLock Themes sucessfully transferred
else
	echo GroovyLock Not Currently Installed
fi

if [[ -d /System/Library/LockCydgets ]]; then
	mkdir /private/var/mobile/"$project"/System/Library/LockCydgets
	cp -rf "/System/Library/LockCydgets" "/private/var/mobile/"$project"/System/Library/LockCydgets"
	echo Cydget Themes sucessfully transferred
else
	echo Cydget Not Currently Installed
fi

if [[ -d /private/var/mobile/"$project"/var/mobile/Library/LockHTML ]]; then
	mkdir /private/var/mobile/"$project"/var/mobile/Library/LockHTML
	cp -rf "/private/var/mobile/"$project"/var/mobile/Library/LockHTML" "/private/var/mobile/"$project"/var/mobile/Library/LockHTML"
	echo LockHTML Themes sucessfully transferred
else
	echo LockHTML Not Currently Installed
fi


if [[ -d /private/var/mobile/Library/MyFonts2 ]]; then
	mkdir -p /private/var/mobile/"$project"/var/mobile/Library/MyFonts2
	cp -rf "/private/var/mobile/Library/BytaFont2" "/private/var/mobile/"$project"/var/mobile/Library/MyFonts2"
	echo Fonts sucessfully transferred
else
	echo BytaFont2 is not Currently Installed
fi

if [[ -d /private/var/mobile/Library/Bytafont3/SwapMode/ ]]; then
	mkdir -p /private/var/mobile/"$project"/var/mobile/Library/Bytafont3/SwapMode/
	cp -rf "/private/var/mobile/Library/Bytafont3/SwapMode/" "/private/var/mobile/"$project"/var/mobile/Library/Bytafont3/SwapMode/"
	echo "Fonts sucessfully transferred"
else
	echo BytaFont3 Not Currently Installed
fi
