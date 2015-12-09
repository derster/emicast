class AddAdminIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :admin_id, :integer
  end
end
