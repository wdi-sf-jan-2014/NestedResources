class LinkWorker
	include Sidekiq::Worker

	def perform(post_id)
		post = Post.find(post_id)
		request = Typhoeus.get(post.link)
		if request.response_code == 0 or request.response_code >= 400
			post.destroy
		end
	end

end