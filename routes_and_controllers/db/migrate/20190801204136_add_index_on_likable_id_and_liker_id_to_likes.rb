class AddIndexOnLikableIdAndLikerIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, ["liker_id", "likable_type", "likable_id"], unique: true
  end
end
