class Tweet < Struct.new(:author, :handle, :timestamp, :content, :avatar_url, :video_id)
  def self.from(hash)
    TweetBuilder.new(hash).build
  end
end
