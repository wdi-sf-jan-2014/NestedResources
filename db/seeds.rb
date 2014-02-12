
post = Post.create(link: "somewhere", body: "A good post" )
post.comments.create(body: "That was a great article")
post.comments.create(body: "Terrible article")