class AddBandeFmToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :bande_fm, :string
  end
end
