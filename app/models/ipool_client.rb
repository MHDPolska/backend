class IpoolClient
  def initialize
    @base_path = '/api/v3'

    @consumer = OAuth::Consumer.new(ENV['IPOOL_KEY'], ENV['IPOOL_SECRET'], site: ENV['IPOOL_SITE'])
    @api = OAuth::AccessToken.new(@consumer)
  end

  def get(path, params = {})
    JSON.parse @api.get("#{@base_path}#{path}?#{params.to_query}").body
  end

  ####

  def events(options = {})
    options.reverse_merge! language: :en

    response = get('/topics/hot', options.merge('entityTypes' => %q{"events"}))
    response.map { |hash| Event.from(hash) }
  end
end
