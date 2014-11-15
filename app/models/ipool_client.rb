class IpoolClient
  def initialize
    @base_path = '/api/v3'

    @consumer = OAuth::Consumer.new(ENV['IPOOL_KEY'], ENV['IPOOL_SECRET'], site: ENV['IPOOL_SITE'])
    @api = OAuth::AccessToken.new(@consumer)
  end

  def get(path, params = {})
    params.reverse_merge! language: :de, sources: %q{-"fingerpost"}
    JSON.parse @api.get("#{@base_path}#{path}?#{params.to_query}").body
  end

  ####

  def topics
    topics = get('/topics/trending', entityTypes: %q["events"])

    topics.map do |topic|
      topic_name = topic['name']

      article = get('/search', events: %Q["#{topic_name}"], sortBy: :dateCreated, order: :desc, types: %q["article"], limit: 1)['documents'].first
      picture_url = article['contentReferences'].find { |ref| ref['type'] == 'PICTURE' }.try(:[], 'externalUrl')

      Topic.new(topic_name, article['identifier'], article['title'].strip, picture_url)
    end
  end
end
