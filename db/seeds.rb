post = Post.create(link: "http://www.cnn.com", body: "This is a seed post.")
post.comments.create(body: "This is comment 1.")
post.comments.create(body: "This is comment 2.")