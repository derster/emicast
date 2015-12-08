class AddAdminIdToEmission < ActiveRecord::Migration
  def change
    add_column :emissions, :admin_id, :integer
  end
end
