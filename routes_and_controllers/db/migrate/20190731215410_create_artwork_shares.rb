class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, presence: true
      t.integer :viewer_id, presence: true
      t.index [:artwork_id, :viewer_id], unique: true
      t.index :artwork_id
      t.index :viewer_id
      t.timestamps
    end
  end
end
