class EventsController < ApplicationController
  before_filter :setup_client

  def index
    @events = @client.events
  end

  private

  def setup_client
    @client ||= IpoolClient.new
  end
end
