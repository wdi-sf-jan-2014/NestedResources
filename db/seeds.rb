# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create(link: "www.facebook.com", body: "omg this site is my FAVE.")
Post.create(link: "www.reddit.com", body: "only losers use this lolz")

Comment.create(body: "YOUR FACE is a book", post_id: 1)
Comment.create(body: "UR A LOOSR", post_id: 1)
Comment.create(body: "YOU'RE MY FAVORITE SITE", post_id: 2)
Comment.create(body: "UR A LOOSRer", post_id: 2)