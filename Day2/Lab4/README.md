# Day2 Lab4

## In this lab, we are going to learn about the concept of Namespacing, Autoloading.
- Create a class to install nginx.
- Create a class to configure an HTML page with content ""Namespace example"".
- Create another class to restart the nginx service.
- Use namespacing to create a wrapper class and include it.

## Generate a module using puppet module generate command.
```
	puppet module generate ar-namespacing
```
## Create a class to install nginx.
- Create manifests/installnginx.pp file and write class inside it
```
	class namespacing::installnginx {
	package { 'nginx':
	  ensure => installed,
	}
	}
```
## Create other two class in similar manner 
## Use namespacing to create a wrapper class and include it.
- Considering manifests/init.pp as wrapper class, insert belwo code
```
	class namespacing {
	  include namespacing::installnginx
	  include namespacing::confhtml
	  include namespacing::servicestate
	  notify { 'greeting':
	      message => 'Hello, I am Learning Puppet',
	  } 
	}
```
- Run module using command
```
	puppet apply --modulepath=<module-path namespacing/examples/init.pp
``` 




