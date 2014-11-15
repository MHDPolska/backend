class TopicsController < ApplicationController
  before_filter :setup_client

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
end
