#messing around with blank input
read -p "What SpringBoard theme will you be using and give the location of the file : " n1 
if [[ ! $n1  =~ ^( "" ) ]]; then 
	echo "SpringBoard Theme name: NONE" >> Theme.txt
#if not left blank
elif [[ ! $n1 =~ ^( "$n1" ) ]]; then
	find $n1 -type f -printf "SpringBoard Theme name: %f\n" >> Theme.txt
else
	echo error
fi
