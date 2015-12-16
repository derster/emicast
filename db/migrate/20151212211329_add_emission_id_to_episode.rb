class AddEmissionIdToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :emission_id, :integer
  end
end
