class UserBelongsToGroup < ActiveRecord::Migration
  def self.up
    add_column :users, :group_id, :integer
    add_index :users, :group_id
  end

  def self.down
    remove_column :users, :group_id
  end
end
