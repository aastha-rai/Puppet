if ! which nginx > /dev/null 2>&1;
then
        echo  "Installing $1"
        if [  -n "$(uname -a | grep Ubuntu)" ];
        then
                sudo apt-get update && sudo apt-get upgrade
                sudo apt-get install $1 
        else
                sudo yum update
                sudo yum install $1
        fi
else
        echo "$1 is already installed"
fi

