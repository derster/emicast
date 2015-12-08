class CreateEmissions < ActiveRecord::Migration
  def change
    create_table :emissions do |t|

      t.timestamps null: false
    end
  end
end
