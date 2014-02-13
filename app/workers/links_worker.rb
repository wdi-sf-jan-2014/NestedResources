class LinksWorker
  include Sidekiq::Worker

  def perform(post_id)
    require 'open-uri'
    post = Post.find(post_id)
    if (post)
    	link = post.link
	    uri = URI.parse(link)
	    if uri.scheme != "http"
	    	link = "http://"+link
	    end
	     response = Typhoeus.get(link)
	     if response.response_code > 399
	        post.destroy
	     end
	       
	end #if
  end #method



end #class
