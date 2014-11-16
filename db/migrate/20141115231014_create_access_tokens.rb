class CreateAccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.string :token
      t.string :refresh_token
      t.datetime :expires_at
    end
  end
end
