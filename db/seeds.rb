# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.first
post_one = user.posts.create(link: "www.valleywag.com", body: "silicon valley gossip blog")
post_two = user.posts.create(link: "www.jaunted.com", body: "pop culture travel blog")
post_three = user.posts.create(link: "www.hotelchatter.com", body: "hotel news and reviews")
post_four = user.posts.create(link: "www.amazon.com", body: "buy almost anything")

post_one.comments.create(body: "great news", user_id: 1)
post_two.comments.create(body: "travel news you won't see anywhere else", user_id: 1)
post_two.comments.create(body: "part of conde nast", user_id: 1)
post_four.comments.create(body: "makes a great e-book reader", user_id: 1)
post_four.comments.create(body: "everything from books to rugby cleats", user_id: 1)
