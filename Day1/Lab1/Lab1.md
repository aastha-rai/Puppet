# DAY 1 

## What you will learn from this lab
In this lab, we are going to simulate an SCM tool using a shell script.
- Create a shell script that can install packages, create a user.
- For packages use nginx as a package.
- For username take "joe" as a user and create a home directory for same.
- Make this script idempotent, so whenever we execute this, it will check for the changes and if required, only it will make the change.

Bonus Lab:- Add the support to take multiple packages and users as argument

## Instructions to perform this lab
- Create a file eg. installPackage.sh 
- Add script to check weather a package is present or not. You can do it using below script
	- if ! which nginx > /dev/null 2>&1;
          then
                 echo  "Not Installed"
          else
                 echo "$1 is already installed"
          fi
- Add script to check your platform and install package accordingly
	- if [  -n "$(uname -a | grep Ubuntu)" ];
          then
                 sudo apt-get update && sudo apt-get upgrade
                 sudo apt-get install $1 
          else
                 sudo yum update
                 sudo yum install $1
         fi
- Combine both the scripts.
- Check file permission.
- Run Th script


