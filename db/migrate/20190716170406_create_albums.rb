class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :spotify_id
      t.string :title
      t.string :artist
      t.string :cover

      t.timestamps
    end
  end
end
