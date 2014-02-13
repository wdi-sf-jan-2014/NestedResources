# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {
    name: "Kai",
    email: "kai.hofius@gmail.com",
    password: "password",
    password_confirmation: "password"
  }, {
    name: "jim",
    email: "jims@fmail.com",
    password: "password",
    password_confirmation: "password"
  }
  ])

Post.create(link: "www.facebook.com", body: "omg this site is my FAVE.", user_id: 1)
Post.create(link: "www.reddit.com", body: "only losers use this lolz", user_id: 2)

one = Comment.create(body: "YOUR FACE is a book", commentable_id: 1, commentable_type: "Post")
two = Comment.create(body: "UR A LOOSR", commentable_id: 1, commentable_type: "Post")
three = Comment.create(body: "WATCH YR MOUTH", commentable_id: two.id, commentable_type: "Comment" )
four = Comment.create(body: "YOU'RE MY FAVORITE SITE", commentable_id: 2, commentable_type: "Post")
five = Comment.create(body: "UR A LOOSRer", commentable_id: 2, commentable_type: "Post")