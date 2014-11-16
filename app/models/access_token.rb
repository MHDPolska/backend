class AccessToken < ActiveRecord::Base
  def update_with(hash)
    self.token = hash[:token] || hash['token']
    self.refresh_token = hash[:refresh_token] || hash['refresh_token']
    self.expires_at = Time.at(hash[:expires_at] || hash['expires_at']).to_datetime
    self.save!
  end

  def refresh!
    connection = Faraday.new(url: 'https://accounts.google.com') do |builder|
      builder.request  :url_encoded
      builder.adapter  Faraday.default_adapter
    end

    response = connection.post '/o/oauth2/token', {
      client_id: ENV['YOUTUBE_ID'],
      client_secret: ENV['YOUTUBE_SECRET'],
      refresh_token: refresh_token,
      grant_type: 'refresh_token'
    }
    json = JSON.parse(response.body)

    self.token = json['access_token']
    self.expires_at = DateTime.now + json['expires_in'].seconds
    self.save!
  end

  def expired?
    DateTime.now >= self.expires_at
  end
end
