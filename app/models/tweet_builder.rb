class TweetBuilder
  def initialize(hash)
    @hash = hash
  end

  def author
    @hash[:user][:name]
  end

  def handle
    @hash[:user][:screen_name]
  end

  def timestamp
    @hash[:created_at]
  end

  def content
    @hash[:text]
  end

  def avatar_url
    @hash[:user][:profile_image_url]
  end

  def video_url
    @hash[:entities][:urls].find { |url| url[:expanded_url].match(%r{//(www\.)?(youtu\.be|youtube.com)}) }.try(:[], :expanded_url)
  end

  def video_id
    video_url.match(%r{(?:v=|be/)(\w+)})[1] if video_url
  end

  def build
    Tweet.new(author, handle, timestamp, content, avatar_url, video_id)
  end
end
