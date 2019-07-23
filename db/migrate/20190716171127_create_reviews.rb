class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :album, foreign_key: true
      t.string :title
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
