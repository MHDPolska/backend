json.topics @topics do |topic|
  json.id topic.article_id
  json.name topic.name
  json.pictureUrl topic.picture_url
  json.articleTitle topic.article_title
end

