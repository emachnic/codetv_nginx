require 'chefspec'

describe 'packages::default' do
  chef_run = ChefSpec::ChefRunner.new(platform: 'ubuntu', version: '12.04')
  chef_run.converge 'packages::default'
  it 'installs sqlite3 package' do
    expect(chef_run).to install_package 'sqlite3'
  end
end
