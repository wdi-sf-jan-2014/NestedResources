class LinksWorker
  include Sidekiq::Worker

  def perform(post_id)
    post = Post.find(post_id)
    if (post)
        if (post.link.starts_with? 'http://', 'https://')
          response = Typhoeus.get(post.link)
          if response.response_code > 399
            post.destroy
          end
        else
          post.destroy
        end  
    end
  end
end