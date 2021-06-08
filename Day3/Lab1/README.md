# Day3 Lab1

## In this lab, we are going to understand concept of Scope and Defined Resource types.
- We are going to create a class scope which will notify message for class scope and same thing for node scope, local scope.
- We will create a custom resource type to create a sshuser which will create the below things:-
    - SSH user
    - Home directory
    - SSH directory
    - Empty authorize key file

Bonus Lab:- Create a define class for nginx configuration, which will take port, path and domain name as input and create a nginx config file in /etc/nginx/sites-enabled/.

## We are going to create a class scope which will notify message for class scope and same thing for node scope, local scope.
```
	class scope_example {
	  $variable = "Hi!"
	  notify {"Message from here: $variable":}
	  notify {"Node scope: $node_variable Top scope: $top_variable":}
	}
	# /etc/puppetlabs/code/environments/production/manifests/site.pp
	$top_variable = "Available!"
	node default {
	  $node_variable = "Available!"
	  include scope_example
	  notify {"Message from node scope: $variable":}
	}
	notify {"Message from top scope: $variable":}
```

## Task2

```
define users::sshuser (
  $comment
) {
  user { $title:
    ensure   => present,
    name     => $title,
    comment  => $comment,
    home     => "/home/${title}",
  }
file { "/home/${title}":
    ensure  => directory,
    owner   => $title,
    group   => $gid,
    mode    => '0750',
    require => User[$title],
  }
file { "/home/${title}/.ssh":
    ensure  => directory,
    owner   => $title,
    group   => $gid,
    mode    => '0750',
    require => File["/home/${title}"],
  }
file { "/home/${title}/.ssh/authorized_keys":
    ensure  => file,
    owner   => $title,
    mode    => '0600',
    require => File["/home/${title}/.ssh"],
  }
}

users::sshuser { 'abc':
    comment => "created by puppet",
}
         
```

