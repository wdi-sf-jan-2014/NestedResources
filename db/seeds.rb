post = Post.create(link: 'www.google.com', body: 'A great search engine, GFGFI')
post.comments.create(body: 'Oh, this is cool!')
post.comments.create(body: 'It even has images!')