class AddPhotoToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :photo_url, :string, null: false
  end
end
