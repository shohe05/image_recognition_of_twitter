class RenamePostedToImage < ActiveRecord::Migration
  def up
    rename_column :images, :posted, :posted_at
  end

  def down
    rename_column :images, :posted_at, :posted
  end
end
