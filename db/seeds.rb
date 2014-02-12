post = Post.create(link: "reddit.com", body: "The original!")
another_post = Post.create(link: "google.com", body: "Google is cool")
third_post = Post.create(link: "http://generalassemb.ly", body: "General Assembly is a place to learn")


post.comments.create(body: "ilu reddit")
post.comments.create(body: "9gag is better")
post.comments.create(body: "#2 you're an idiot")
post.comments.create(body: "no u")

another_post.comments.create(body: "Careful not to get scroogled")
another_post.comments.create(body: "lol")
another_post.comments.create(body: "I hate signing into Youtube using G+")


third_post.comments.create(body: "Wdi is so hard")
third_post.comments.create(body: "It's all for the best though!")