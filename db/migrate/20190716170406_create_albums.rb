class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.references :artist
      t.string :release_date
      t.string :tracks
      t.string :images
      t.string :external_urls
      t.string :label
      # t.references :collections

      t.timestamps
    end
  end
end
