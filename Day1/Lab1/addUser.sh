if cat /etc/passwd | grep $1 
then
	echo "user is already present"
else
	echo "Creating user and home directory"
	sudo useradd -m $1        
fi

