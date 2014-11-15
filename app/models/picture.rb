class Picture < ActiveRecord::Base
  def self.get(id)
    pic = self.find_or_initialize_by(external_id: id)
    unless pic.persisted?
      data = IpoolClient.new.picture(id)
      pic.image = data
      pic.save!
    end

    pic
  end
end
