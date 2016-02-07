class Emission < ActiveRecord::Base
  searchkick
	belongs_to :admin
	belongs_to :category
  has_many :episodes

	  has_attached_file :thumbnail, styles: { medium: "400x400>", thumb: "200x200>" }
  	validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

  	has_attached_file :cover, styles: { medium: "1152x768>"}
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  	validates :title, presence:{
  		message:"Le titre est obligatoire"
  	}
  	validates :description, presence:{
  		message:"Ajouter une description"
  	}
  	validates :category_id, presence:{
  		message:"Effectuer une selection"
  	}
end
