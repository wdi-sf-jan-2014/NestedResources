# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
users << User.create(email: 'Calista@isa.com', password: 'password1', password_confirmation: 'password1')
users << User.create(email: 'Fernando@isa.com', password: 'password2', password_confirmation: 'password2')
users << User.create(email: 'Alice@isa.com', password: 'password3', password_confirmation: 'password3')
users << User.create(email: 'r2d2@isa.com', password: 'password4', password_confirmation: 'password4')
users << User.create(email: 'Luke@isa.com', password: 'password5', password_confirmation: 'password5')

posts = []
posts << Post.create(link: 'https://github.com/plataformatec/devise', body: 'Devise Gem is for lovers')
posts << Post.create(link: 'https://github.com/missherico/NestedResources', body: 'Nested Resources are also for lovers')
posts << Post.create(link: 'https://news.ycombinator.com/', body: 'rambuncious other-world bulletins')
posts << Post.create(link: 'https://www.facebook.com/', body: 'Facebook is for family.')
posts << Post.create(link: 'http://railsbridge.org/', body: 'RailsBridge is for the people.')
posts << Post.create(link: 'http://grandgood.com/', body: 'GrandGood is for the music snob.')
posts << Post.create(link: 'https://twitter.com/msherico', body: 'my twitter is for the new-school hippie.')
posts << Post.create(link: 'https://developer.mozilla.org/en-US/', body: 'MDN is a developer\'s best friend')

comments = []
comments << Comment.create(comment: 'oh i love it.')
comments << Comment.create(comment: 'this is no bueno.')
comments << Comment.create(comment: 'good find!')
comments << Comment.create(comment: 'i happen to favor another site just like this one.')
comments << Comment.create(comment: 'you are spot on!')
comments << Comment.create(comment: 'things happen, and I use this to get me out of messes.')
comments << Comment.create(comment: 'great afternoons have been spent on this site.')
comments << Comment.create(comment: 'my brain hurts.')
comments << Comment.create(comment: 'happy that i found this, thanks for sharing.')
comments << Comment.create(comment: 'beleaguered.')
comments << Comment.create(comment: 'do you also know how much this information is worth?!')
comments << Comment.create(comment: 'i found this cheaper on Amazon.')
comments << Comment.create(comment: '*hides for cover*')
comments << Comment.create(comment: 'asbkjfaweirb')
comments << Comment.create(comment: 'we found this very interesting.')


users[0].posts << posts[-1]
users[0].posts << posts[-2]
users[1].posts << posts[0]
users[2].posts << posts[1]
users[3].posts << posts[2]
users[4].posts << posts[3]
users[3].posts << posts[4]
users[2].posts << posts[5]


posts[0].comments << comments[0]
posts[0].comments << comments[1]
posts[0].comments << comments[2]
posts[0].comments << comments[3]
posts[0].comments << comments[4]
posts[1].comments << comments[5]
posts[1].comments << comments[6]
posts[3].comments << comments[7]
posts[4].comments << comments[8]
posts[5].comments << comments[9]
posts[6].comments << comments[-5]
posts[7].comments << comments[-4]
posts[7].comments << comments[-3]
posts[7].comments << comments[-2]
posts[7].comments << comments[-1]

