class Episode < ActiveRecord::Base
	belongs_to :emission

	validates :title, presence:{
		message:"Le titre est obligatoire"
	}

	validates :description, presence:{
		message:"la description est obligatoire"
	}

	has_attached_file :thumbnail, styles: { medium: "1200x400>"}
  	validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/


	has_attached_file :mp3
	validates_attachment :mp3, :content_type => {:content_type => ["audio/mpeg", "audio/mp3"]}, :file_name => { :matches => [/mp3\Z/]}
  
end
