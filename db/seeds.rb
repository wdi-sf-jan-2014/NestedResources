
post = Post.create(link: "somewhere", body: "A good post" )
post.comments.create(body: "That was a great article")
post.comments.create(body: "Terrible article")

# Comment.find(1).comments.create(body: "That's a terrible comment.")
# Comment.find(2).comments.create(body: "Stop commenting on my comments")