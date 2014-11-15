class PicturesController < ApplicationController
  def show
    @picture = Picture.get(params[:id])

    expires_in 2.days, public: true
    send_data @picture.image, type: 'image/jpeg', disposition: 'inline'
  end
end
