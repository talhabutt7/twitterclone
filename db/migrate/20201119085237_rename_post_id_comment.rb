class RenamePostIdComment < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :post_id, :tweeet_id
  end
end
