class AddCategoryIdToEmission < ActiveRecord::Migration
  def change
    add_column :emissions, :category_id, :integer
  end
end
