class AddAttachmentCoverToEmissions < ActiveRecord::Migration
  def self.up
    change_table :emissions do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :emissions, :cover
  end
end
