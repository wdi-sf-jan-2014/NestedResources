post = Post.create(link: "http://www.google.com", body: "Best search engine ever!")
post.comments.create(body: "Totally agree!")
post.comments.create(body: "Down with bing")