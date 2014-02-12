# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


post = Post.create(link: "http://reddit.com", body: "Ayo I'm a post")
       post.comments.create(body: "Commentin")
       post.comments.create(body: "I'm a comment")