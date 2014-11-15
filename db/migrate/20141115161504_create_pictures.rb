class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :external_id
      t.binary :image
    end

    add_index :pictures, :external_id, unique: true
  end
end
