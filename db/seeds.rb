# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

simran= Post.create(link: "www.google.com", body: "I love this site!")
simran.comments.create(body: "I love it too!")
simran.comments.create(body: "WOOHOO!")

andrea= Post.create(link: "www.reddit.com", body: "The real og reddit!")
andrea.comments.create(body: "Here goes three hours of my life...")
andrea.comments.create(body: "Yaay puppy pics!")

kaur= Post.create(link: "www.simranisthebest.com", body: "Simran is truly the best.")
kaur.comments.create(body: "Simran is clearly the next President of the US.")
kaur.comments.create(body: "WOW!")

