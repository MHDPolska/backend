class Event < Struct.new(:name, :news_count)
  def self.from(hash)
    self.new(hash['name'], hash['count'])
  end
end
