post = Post.create(link: "reddit.com", body: "The original!")
another_post = Post.create(link: "google.com", body: "For all your learning")

post.comments.create(body: "ilu reddit")
post.comments.create(body: "9gag is better")
post.comments.create(body: "#2 you're an idiot")
post.comments.create(body: "no u")

another_post.comments.create(body: "Careful not to get scroogled")
another_post.comments.create(body: "lol")
another_post.comments.create(body: "I hate signing into Youtube using G+")