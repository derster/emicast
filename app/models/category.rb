class Category < ActiveRecord::Base
	belongs_to :admin
	
	belongs_to :emission

	validates :name, presence:{
		message: "La Category est obligatoire"
	}
end
