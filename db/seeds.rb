# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create({ link: 'http://google.com', body: 'Google is cool'})
Post.create({ link: 'http://generalassemb.ly', body: 'General Assembly is a place to learn'})