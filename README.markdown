# Vagrant Box with Ubuntu 14.04, Nginx, MySQL and PHP-FPM

A Vagrant setup to create an Ubuntu 14.04 (Trusty) virtual machine with Nginx, MySQL and PHP for WordPress development.

Intended to be as simple as possible:


#### Summary

* Quickly create a fresh WP instance served up via the Vagrant server.
* Optionally specify which version of WP to install
* Choose PHP 5.5, 5.6 or 7.0
* Can be dropped into an existing WP directory to provide a LEMP testing and development server with minimal config changes
* Can load database dump as part of provisioning
* Renames all domain references using WP-CLI
* Dumps the database to the shared folder on `vagrant destroy` — (this needs the [vagrant triggers plugin](https://github.com/emyl/vagrant-triggers) to be installed from [(https://github.com/emyl/vagrant-triggers)](https://github.com/emyl/vagrant-triggers))
* Remote debugging using XDebug

## Acknowledgements

This Vagrant box and provisioning is based on (https://github.com/digitalquery/wp-vagrant) 

## What's included in the VM?

* Ubuntu 14.04 LTS (Trusty Tahir)
* Nginx, listening on port 80
* MySQL, listening for remote connections
* Choose between  PHP 5.5, 5.6 or 7.0, with OpCache and XDebug
* PHP-FPM
* [Byobu](http://byobu.co/)
* [WP-CLI](wp-cli.org)
* APCu
* Dump database automatically on `vagrant destroy`


## Instructions

These instructions are OS X specific, but the overall solution should work on any platform that Vagrant and VirtualBox support.

### Before you start

* Install VirtualBox
	* [VirtualBox site (https://www.virtualbox.org/wiki/Downloads)](https://www.virtualbox.org/wiki/Downloads)

* Install Vagrant
	* [Vagrant site (https://www.vagrantup.com/downloads.html)](https://www.vagrantup.com/downloads.html)

* Install Vagrant triggers 
	* ```
	$ vagrant plugin install vagrant-triggers
	```
	
* Install vagrant-hostupdater 
	* ```
	$ vagrant plugin install vagrant-hostsupdater
	`

### Fresh WP install

Use these instructions if you want to create a new WP site with the default empty database.

1. Fire up Vagrant to create the VM and then run the provisioning scripts
	* `vagrant up`
	* This may take a little while as the provisioning scripts download and install everything
2. Browse to 192.168.50.2 - you should see the default twentyfourteen theme

### PHP version

To change the PHP version, edit `settings.sh` and set the `php_version` setting to 5.5, 5.6 or 7.0. Run `vagrant provision` if you're changing an already created vagrant instance

### Settings.sh

The full list - more comments and explanation are in the `settings.sh`file itself. 
