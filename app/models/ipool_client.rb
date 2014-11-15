class IpoolClient
  attr_reader :api

  def initialize
    @base_path = '/api/v3'

    @consumer = OAuth::Consumer.new(ENV['IPOOL_KEY'], ENV['IPOOL_SECRET'], site: ENV['IPOOL_SITE'])
    @api = OAuth::AccessToken.new(@consumer)
  end

  def get_json(path, params = {})
    JSON.parse get(path, params)
  end

  def get(path, params = {})
    params.reverse_merge! language: :de, sources: %q{-"fingerpost"} unless params.nil?
    @api.get("#{@base_path}#{path}?#{params.try(:to_query)}").body
  end

  ####

  def topics
    topics = get_json('/topics/trending', entityTypes: %q["events","products"])

    topics.map do |topic|
      topic_name = topic['name']
      entity_type = topic['entityType']

      article = get_json('/search', entity_type => %Q["#{topic_name}"], sortBy: :dateCreated, order: :desc, types: %q["article"], limit: 1)['documents'].first

      Topic.new(topic_name, entity_type, Article.from(article))
    end
  end

  def topic(id)
    article = get_json("/search/#{id}")
    Topic.new(article['entities']['events'].first['lemma'], Article.from(article))
  end

  def picture(id)
    get("/object/#{id}", nil)
  end
end
