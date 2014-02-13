users = []
users << User.create(email: "kevin@gmail.com", password: "12345678", password_confirmation: "12345678")
users << User.create(email: "sasha@gmail.com", password: "12345678", password_confirmation: "12345678")
users << User.create(email: "luke@gmail.com", password: "12345678", password_confirmation: "12345678")

posts = []
posts << Post.create(body: "Blah blah blah blah", link: "www.google.com")
posts << Post.create(body: "Someone left their pen.... Let's try to guess who?", link: "www.google.com")



# comments << Comment.create(comment_body: "Oooooooo! What kind of pen is it?")
# comments << Comment.create(comment_body: "ZOMG! it could be mine!")
# comments << Comment.create(comment_body: "Are you sure it's yours? PROVE IT!")
# comments << Comment.create(comment_body: "it's pink with a fluffy unicorn!")
# comments << Comment.create(comment_body: "I think it's Darren's pen....")

# users[1].comments << comments[0]
# users[2].comments << comments[1]
# users[0].comments << comments[2]
# users[2].comments << comments[3]
# users[0].comments << comments[4]

posts[1].comments.create(body: "Oooooooo! What kind of pen is it?")
posts[1].comments.create(body: "ZOMG! it could be mine!")
posts[1].comments.create(body: "Are you sure it's yours? PROVE IT!")
posts[1].comments.create(body: "it's pink with a fluffy unicorn!")
posts[1].comments.create(body: "I think it's Darren's pen....")
users[1].posts << posts[0]
users[0].posts << posts[1]

p = Post.create(body: "Rick and Morty 100 years")
c = p.comments.create(body: "MEESEEKS")
d = c.comments.create(body: "Did you straighten your shoulders?")
d = c.comments.create(body: "You just need to relax")