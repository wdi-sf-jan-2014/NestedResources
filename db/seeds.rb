post = Post.create(body: "First post")
post.comments.create(body: "first comment on post")
post.comments.create(body: "second comment on post")
post.comments.create(body: "third comment on post")

post = Post.create(body: "Second post")
post.comments.create(body: "first comment on post")
post.comments.create(body: "second comment on post")