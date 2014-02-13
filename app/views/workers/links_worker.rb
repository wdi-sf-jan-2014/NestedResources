class LinksWorker
  include Sidekiq::Worker

  def perform(post_id)
    require 'open-uri'
    post = Post.find(post_id)
    if (post)
	    uri = URI.parse(post.link)

	    domain = uri.scheme + '://' + uri.host
	    domain += ':' + uri.port.to_s if uri.port != 80 && uri.port != 443

	    contents = Nokogiri::HTML(open(post.link))
	    contents.css('a').each do |link|
	      link_href = link.attributes['href'].value
	      if (link_href.starts_with? '/')
	        link_href = domain + link_href
	      end

	      if (link_href.starts_with? 'http://', 'https://')
	        response = Typhoeus.get(link_href)

	        site.links.create(url: link_href, http_response: response.response_code)
	      end  
	    end
	  end
  end
end
