module PostsHelper

  
  def only_posts_with_comments
      posts = Post.all
      @posts_without_comments = []
      posts.each do |post|
      if post.comments.nil?
        @posts_without_comments << post
       end
      end
  end

end
