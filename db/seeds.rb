post = Post.create(link: "Facebook.com", body: "Too many nosey people on there")
post.comments.create(body: "Reason why I don't have a facebook account")
post.comments.create(body: "I'm addicted and I can't help it")
post.comments.create(body: "I like facebook")

post = Post.create(link: "Instagram.com", body: "find some awesome pictures")
post.comments.create(body: "I love pictures")
post.comments.create(body: "Don't tag me")