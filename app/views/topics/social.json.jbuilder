json.array! @tweets do |tweet|
  json.author do 
    json.name      tweet.author
    json.handle    tweet.handle
    json.avatarUrl tweet.avatar_url
  end
  json.timestamp tweet.timestamp
  json.content   tweet.content
  json.videoId   tweet.video_id
end
