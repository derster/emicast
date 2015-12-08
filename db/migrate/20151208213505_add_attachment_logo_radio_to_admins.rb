class AddAttachmentLogoRadioToAdmins < ActiveRecord::Migration
  def self.up
    change_table :admins do |t|
      t.attachment :logo_radio
    end
  end

  def self.down
    remove_attachment :admins, :logo_radio
  end
end
