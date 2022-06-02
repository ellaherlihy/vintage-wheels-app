class AddReviewsToCar < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.references :car, foreign_key: true
    end
  end
end
