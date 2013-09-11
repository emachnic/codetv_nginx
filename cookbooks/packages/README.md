Description
===========

Cookbook to install dependencies for Ruby on Rails applications in Ubuntu

Requirements
============

Attributes
==========

Usage
=====

For Vagrant, in your Vagrantfile, add 'packages' to the run list:

		config.vm.provision :chef_solo do |chef|
			chef.add_recipe 'packages'
		end

