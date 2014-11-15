module ApplicationHelper
  def resolve_urls(urls)
    urls.map do |url|
      if url.respond_to? :local?
        picture_url(url.id)
      else
        url
      end
    end
  end
end
