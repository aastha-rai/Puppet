# DAY2 Lab3

## In this lab, we are going to learn the concepts of Conditionals and Functions.
- Create a condition if the OS family is Debian and Ubuntu and add fail conditions.
- Create a conditional logic to install apache2 on Ubuntu and httpd on CentOS.
- Also slit a string using the split function. Split your Full Name.

### Create a condition if the OS family is Debian and Ubuntu and add fail conditions.
- Add Condition to your site.pp file.
```
	if $::osfamily == 'Ubuntu' {
        	 notify { "Hello Ubuntu": }
	}
	elsif $::osfamily == 'Debian' {
        	notify { "Hello Debian": }
	}
	else {
        	fail()
	}
### Create a conditional logic to install apache2 on Ubuntu and httpd on CentOS.
- Task1 code as refernce and here you can use package resource installing packages specific to family

### Also slit a string using the split function. Split your Full Name.
- Puppet apply below script
```
	$string     = 'Aastha_Rai'
	$array_var2 = split($string, '[_]')
	notify { "$string splits to $array_var2": }
```
 
~             
