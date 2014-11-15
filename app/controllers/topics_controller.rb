class TopicsController < ApplicationController
  before_filter :setup_client
  before_filter :setup_cache

  def index
    @topics = @client.topics
  end

  def show
    @topic = @client.topic(params[:id])
  end

  def social
    twitter = TwitterClient.new
    topic = @client.topic(params[:id])

    @tweets = twitter.tweets_for(topic).reject { |tweet| tweet.video_url.nil? }
  end

  private

  def setup_client
    @client ||= IpoolClient.new
  end

  def setup_cache
    expires_in 3.minutes, public: true
  end
end
