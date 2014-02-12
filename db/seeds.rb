# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

post1 = Post.create(link: "'Clean' debt-ceiling hike clears House, heads to Senate", body:
	" A divided U.S. House voted Tuesday to let the government borrow enough money to pay its bills for the next year, sending the measure to the Senate in an effort by Republican leaders to avoid another politically damaging legislative impasse over spending.")
post1.comments.build(body: "I can't believe it")
post1.comments.build(body: "I wish they weren't divided")	


post2 = Post.create(link: " Remembering a past event", body:  "When you remember a past event ,you're
	actually remembering the last time you remembered it, not the event itself")

	post2.comments.build(body: " I didn't know that")
	post2.comments.build(body: "This is so true!")