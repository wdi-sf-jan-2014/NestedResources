class LinksWorker
	include Sidekiq::Worker

def perform(link_id)
  require 'open-uri'
  post = Post.find(link_id)
  link = post.link
  if (link)
    uri = URI.parse(link.url)

    domain = uri.scheme + '://' + uri.host
    domain += ':' + uri.port.to_s if uri.port != 80 && uri.port != 443

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