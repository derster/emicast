class AddAttachmentThumbnailToEmissions < ActiveRecord::Migration
  def self.up
    change_table :emissions do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :emissions, :thumbnail
  end
end
