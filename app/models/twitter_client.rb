class TwitterClient
  attr_reader :api

  def initialize
    @api = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
    end
  end

  def tweets_for(topic)
    query = "#{topic.name} youtube"

    @api.search(query, lang: :de, count: 5).attrs[:statuses].map { |tweet| Tweet.from(tweet) }
  end
end
