json.topics @topics do |topic|
  json.name topic.name
  json.pictureUrl topic.picture_url

  json.article do
    json.id topic.article_id
    json.title topic.article_title
  end
end

