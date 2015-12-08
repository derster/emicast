class CreateEmissions < ActiveRecord::Migration
  def change
    create_table :emissions do |t|
      t.string :title
      t.string :description
      t.string :facebook
      t.string :twitter
      t.string :youtube

      t.timestamps null: false
    end
  end
end
