class LinksWorker
	include Sidekiq::Worker

	def perform(post_id)
		require 'open-uri'
		post = Post.find(post_id)
		link = post.link
		if (link)
			uri = URI.parse(link.url)

		response = Typhoeus.get(link)
		if response.response_code > 399 || response == 0
			post.destroy
		end
	end
end

