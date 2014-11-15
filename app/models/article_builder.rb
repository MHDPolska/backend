class ArticleBuilder
  def initialize(hash)
    @hash = hash
  end

  def picture_references
    if @hash.include? 'contentReferences'
      @hash['contentReferences'].select { |ref| ref['type'] == 'PICTURE' }
    else
      []
    end
  end

  def picture_url(reference)
    if reference['externalUrl']
      reference['externalUrl']
    else
      LocalPicture.new(reference['binaryIdentifier'])
    end
  end

  def summary
    @hash['leadText'] || @hash['leadtext'] || @hash['captions'].first.strip
  end

  def url
    result = @hash['publishedURL']
    unless result.start_with? 'http://'
      result = 'http://' + result
    end

    result
  end

  def build
    Article.new(@hash['identifier'], @hash['title'].strip, summary, url, picture_references.map { |ref| picture_url(ref) })
  end
end
