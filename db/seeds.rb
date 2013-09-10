# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

Mood.create([{name: 'happy'}, {name: 'frustrated'}, {name: 'angry'}, {name: 'chill'}])
Entry.create title: 'Git Real',
             body: "Much of this is re-hash if you've been using Git for a while but I still enjoyed it and did learn a few new concepts",
             mood_id: 1
Entry.create title: 'Try Objective-C',
             body: "Objective-C is one of those languages that I just can't get my head around. It's probably due to the verbose-ness of it and coming from something like Ruby. The course was good but definitely need to go through it again.",
             mood_id: 2
