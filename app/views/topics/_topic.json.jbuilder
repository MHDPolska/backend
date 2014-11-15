json.name         topic.name
json.article do
  json.partial! 'article', article: topic.article
end
