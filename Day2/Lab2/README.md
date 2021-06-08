# DAY2 Lab1

## "In this lab, we are going to understand the concept of Server-Agent, Node Matching, and Data flow.
- Setup Server-Agent configuration on the 2 instances which have been shared with you.
- Test the agent configuration to check certificate authentication.
- List out all the certificates using the puppet command.
- Execute user module on the newly added agent.
- Create a new module to create a file in /tmp directory.
- Add node matching condition for regex of the node name.

Bonus Lab:- Create an nginx module and execute it on the remote system."

### Setup Server-Agent configuration on the 2 instances which have been shared with you.
- Open 8140 port of your instances
### Installing Puppet Server
- vi /etc/hosts add your server-ips
```
	puppet-master-ip puppetmaster puppet
	puppet-client-ip puppetclient
```
- Run below command to enable repository
```
	curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
	sudo dpkg -i puppetlabs-release-pc1-xenial.deb
	sudo apt-get update
```
- Install puppet server
```
	sudo apt-get install puppetserver
```
- vi /etc/default/puppetserver and configure memory
```
	JAVA_ARGS="-Xms3g -Xmx3g -XX:MaxPermSize=256m"
```
- start puppetserver and check status
```
	sudo systemctl start puppetserver
	sudo systemctl status puppetserver
```

###  Installing the Puppet Agent
- vi /etc/hosts add your server-ips
```
        puppet-master-ip puppet
```
- Run below command to enable repository
``` 
	wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
	sudo dpkg -i puppetlabs-release-pc1-xenial.deb
	sudo apt-get update

```
- Install puppet agent
```
        sudo apt-get install puppet-agent
```
- start puppetserver and check status
```
	sudo systemctl start puppet
	sudo systemctl enable puppet
```
### Switch to puppet master
- get cert list
```
	sudo /opt/puppetlabs/bin/puppet cert list
```
- Sign cert
```
	sudo /opt/puppetlabs/bin/puppet cert sign puppetclient
```
### List out all the certificates using the puppet command
```
	sudo /opt/puppetlabs/bin/puppet cert sign --all
```

### Create a new module to create a file in /tmp directory.
- cat /etc/puppetlabs/puppet/puppet.conf and check codedir location
 	eg. /etc/puppetlabs/code
- vi /etc/puppetlabs/code/environments/production/manifests/site.pp and add code to add file and install nginx.
```
	file {'/tmp/it_works.txt':                        # resource type file and filename
	  ensure  => present,                             # make sure it exists
	  mode    => '0644',                              # file permissions
	  content => "It works on ",  # Print the eth0 IP fact
	}

	package { 'nginx':
	  ensure => installed,
	}
```

- Use below command on your puppet agents.
```
	puppet agent --test
```
- check for changes on puppet agents

### Execute user module on the newly added agent.
- In similar way try to execute your user module as well

### Add node matching condition for regex of the node name
- Add notify in site.pp for all nodes starting with "ip" and print message hello
```
	node /ip*/ {
	  notify { "Hello": }
	}
```
- Again run puppet agent --test on your agent server




