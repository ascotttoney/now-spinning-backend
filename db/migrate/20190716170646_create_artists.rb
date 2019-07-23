class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name

      t.timestamps
    end
  end
end


# class CreateArtists < ActiveRecord::Migration[5.2]
#   def change
#     create_table :artists do |t|
#       t.string :external_urls
#       t.string :genres
#       t.string :images
#       t.string :name
#       t.string :spotify_id
#       t.string :uri
#
#       t.timestamps
#     end
#   end
# end
