class AccessTokensController < ApplicationController
  def push
    @token = AccessToken.first_or_initialize
    @token.update_with params

    render json: @token
  end
end
