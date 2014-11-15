class PicturesController < ApplicationController
  def show
    @picture = Picture.get(params[:id])

    send_data @picture.image, type: 'image/jpeg', disposition: 'inline'
  end
end
