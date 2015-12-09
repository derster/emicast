class Emission < ActiveRecord::Base
	belongs_to :admin

	has_attached_file :thumbnail, styles: { medium: "400x400>", thumb: "200x200>" }
  	validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

  	has_attached_file :cover, styles: { medium: "1200x800>"}
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
