# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

post = Post.create(body:"Check out this cute cat!")
post.comments.create(body:"so cute!")
post.comments.create(body:"so freakin cute!")
post.comments.create(body:"I hate cats!")
post.comments.create(body:"You suck!")
post.comments.create(body:"cats FTW!")

post = Post.create(body:"Richard Sherman is the man!")

post = Post.create(body:"Here is the answer to the lab!")
