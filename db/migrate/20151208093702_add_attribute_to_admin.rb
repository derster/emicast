class AddAttributeToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :nom, :string
    add_column :admins, :nom_radio, :string
  end
end
