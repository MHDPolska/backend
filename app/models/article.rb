class Article < Struct.new(:id, :title, :summary, :url, :picture_urls)
  def self.from(hash)
    ArticleBuilder.new(hash).build
  end
end
