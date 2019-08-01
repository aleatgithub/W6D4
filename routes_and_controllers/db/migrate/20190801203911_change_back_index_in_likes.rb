class ChangeBackIndexInLikes < ActiveRecord::Migration[5.2]
  def change
    remove_index :likes, ["likable_type", "likable_id"]
    add_index :likes, ["likable_type", "likable_id"]
  end
end
