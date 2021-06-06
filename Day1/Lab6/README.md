# DAY1 Lab6

## In this lab, we are going to learn about Puppet ordering.
- Use require, to create a file and insert content in it.
- Add a comment in /etc/ssh/sshd_config and use require to ensure ssh service is running
    # I am Puppet
- Use chaining arrows instead of require"
 
### Use require, to create a file and insert content in it.
- Install stdlib module, we will require it of file_line
```
	sudo module install puppetlabs-stdlib
```
- Create file.pp and add content
```
	include stdlib

	file { '/tmp/testfile.txt':
	  ensure => present
	}

	file_line { 'test_line':
	  line => 'awesome',
	  path => '/tmp/testfile.txt',
	  require => File['/tmp/testfile.txt'],
	}
```
- Run and check for changes

### Add a comment in /etc/ssh/sshd_config and use require to ensure ssh service is running
    # I am Puppet
```
	include stdlib

	package { 'openssh-server':
	  ensure => present,
	}

	file_line { 'test_line':
	  line => '# I am Puppet',
	  path => '/etc/ssh/sshd_config',
	  require     =>  Package['openssh-server'],
	}

	service { 'sshd':
	  ensure => running,
	  enable => true,
	  require => File_Line['test_line'],
	}
```
### Use chaining arrows instead of require
```
	include stdlib

	package { 'openssh-server':
	  ensure => present,
	}

	-> file_line { 'test_line':
	  line => '# I am Puppet',
	  path => '/etc/ssh/sshd_config',
	}

	-> service { 'sshd':
	  ensure => running,
	  enable => true,
	}
```

