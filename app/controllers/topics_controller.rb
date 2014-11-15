class TopicsController < ApplicationController
  before_filter :setup_client

  def index
    @topics = @client.topics
  end

  def show
    @topic = @client.topic(params[:id])
  end

  private

  def setup_client
    @client ||= IpoolClient.new
  end
end
