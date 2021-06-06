# DAY1 Lab4

## In this lab, we are going to learn the concepts of Puppet classes.
- Create a class called nginx.
- In the nginx class, please do these things:-
    - Installation of nginx
    - Make sure the nginx service is activated and started
    - Update the HTML page with content ""Puppet classes""
    - Restart the nginx service"

## Instructions to perform this lab
- Create a class, give it your name. Here you are defining a class
```
	class nginx {
	package { 'nginx':
    		ensure => present
	}
	service { 'nginx':
   		ensure => running,
    		require => Package['nginx'],
	}
	file { '/var/www/html/index.nginx-debian.html':
		ensure  => present,
  		replace => true,
  		content => '<h1> Puppet classes </h1>',
	}
	}
```
- Declare the class
```
	class { 'nginx': 
	}
```





