class AddAttachmentCoverRadioToAdmins < ActiveRecord::Migration
  def self.up
    change_table :admins do |t|
      t.attachment :cover_radio
    end
  end

  def self.down
    remove_attachment :admins, :cover_radio
  end
end
