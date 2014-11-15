class LocalPicture
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def local?
    true
  end
end
