# CodeTV Nginx

This is the Code School Journal application used in the Nginx series of CodeTV.

## Setup

Clone the repository:

		$ git clone https://github.com/emachnic/codetv_nginx.git

Go into the directory and run the following:

		$ cd codetv_nginx
		$ bundle install
		$ rake db:setup

After the database is created and seeded, run the server:

		$ rails server

In your browser, go to http://localhost:3000 and you should see the `Entries#index`
page

## Working with Vagrant

Included in the repository is a Vagrantfile for an Ubuntu 12.10 base box.
To set up the Vagrant box, follow these instructions:

1. Install VirtualBox from the [site](https://www.virtualbox.org/wiki/Downloads)
2. Install Vagrant according to the [instructions](http://docs.vagrantup.com/v2/installation/index.html)
3. Run `vagrant up` to download the box and boot up the machine

Once the virtual machine is running, you can SSH into it by running `vagrant ssh`
 
