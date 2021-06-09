#Day3 Lab4

## In this lab, we are going to understand Puppet forge concepts.
- Go to puppet forge and search for puppetforge/apache module.
- Read the README to understand how it can be used with manifests.
- Install the apache version(4.1.0) using puppet install command.
- Verify apache is working from command line.

### Go to puppet forge and search for puppetforge/apache module.
- Go to https://forge.puppet.com/
### Install the apache version(4.1.0) using puppet install command.
```
	puppet module install puppetlabs-apache --version 4.1.0
```
- create a .pp file and add below code.
```
	class { 'apache': }
```
- Run the file
-verify the installation
