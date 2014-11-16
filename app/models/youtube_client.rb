class YoutubeClient
  def initialize
    @api = Google::APIClient.new(application_name: 'Crowd News', application_version: '1.0.0')
    @youtube = @api.discovered_api('youtube', 'v3')

    token = AccessToken.take
    token.refresh! if token.expired?

    @api.authorization = Signet::OAuth2::Client.new(
      :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
      :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
      :client_id => ENV['YOUTUBE_ID'],
      :client_secret => ENV['YOUTUBE_SECRET'],
      :scope => 'https://www.googleapis.com/auth/youtube.upload,https://www.googleapis.com/auth/youtube',
      :access_token => token.token,
      :refresh_token => token.refresh_token,
      :expires_in => token.expires_at.to_time.tv_sec
    )    
  end

  def upload(title, video)
    body = {
      :snippet => {
        :title => title,
        :description => 'Uploaded with CrowdNews',
        :tags => ['crowdnews'],
        :categoryId => 22 # People & Blogs
      },
      :status => {
        :privacyStatus => 'unlisted'
      }
    }

    response = @api.execute(
      api_method: @youtube.videos.insert,
      body_object: body,
      media: Google::APIClient::UploadIO.new(video, 'video/*'),
      parameters: {
        'uploadType' => 'multipart',
        part: body.keys.join(',')
      }
    )

    response.data
  end
end
