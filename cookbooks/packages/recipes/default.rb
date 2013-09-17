#
# Cookbook Name:: packages
# Recipe:: default
#
# Copyright 2013, Evan Machnic
#
# All rights reserved - Do Not Redistribute
#

if platform? 'ubuntu', 'debian'
	%w{nodejs ruby1.9.1-dev zlib1g-dev git-core sqlite3 libsqlite3-dev}.each do |pkg_name|
	%w{nodejs ruby1.9.1-dev zlib1g-dev git-core sqlite3 libsqlite3-dev libxml2-dev libxslt1-dev libffi-dev}.each do |pkg_name|
		package pkg_name do
			action :install
		end
	end
	
	# Install nokogiri outside of Bundler first because it hates Ubuntu
	gem_package 'nokogiri' do
	  version '1.6.0'
	  action :install
  end
  
  # Install bundler so we can bundle our gems
  gem_package 'bundler' do
    action :install
  end
end
end
