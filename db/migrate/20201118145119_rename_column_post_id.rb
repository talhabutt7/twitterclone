class RenameColumnPostId < ActiveRecord::Migration[5.1]
  def change
    rename_column :likes, :post_id, :tweeet_id
  end
end
