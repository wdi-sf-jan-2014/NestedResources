class PostLinkWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
    def perform(post_id)
        require 'open-uri'
        post = Post.find(post_id)
        uri = URI.parse(post.link)
        if response = Net::HTTP.get_response(uri)
          unless response.code.to_i < 400 && response.code.to_i > 200
            post.destroy
          end
        else
          post.destroy
        end
    end
end
