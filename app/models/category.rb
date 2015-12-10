class Category < ActiveRecord::Base
	belongs_to :admin
	
	has_many :emissions

	validates :name, presence:{
		message: "La Category est obligatoire"
	}
end
