class AddDescriptionToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :description, :text
  end
end
