class LinksWorker
  include Sidekiq::Worker

  def perform(post_id)
    require 'open-uri'
    
    post = Post.find(post_id)
    	link = post.link
	    #uri = URI.parse(link)
	    #if uri.scheme != "http"
	    #	link = "http://"+link
	    #end
	     response = Typhoeus.get(link)
	     if response.response_code > 399 || response_code == 0
	        post.destroy
	     end
	       
  end #method



end #class
