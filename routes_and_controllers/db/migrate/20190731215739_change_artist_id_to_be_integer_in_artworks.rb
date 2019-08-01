class ChangeArtistIdToBeIntegerInArtworks < ActiveRecord::Migration[5.2]
  def change
    change_table :artworks do |t|
      t.change :artist_id, 'integer USING CAST(artist_id AS integer)'
    end
  end
end
