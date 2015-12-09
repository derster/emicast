class Category < ActiveRecord::Base
	belongs_to :admin

	validates :name, presence:{
		message: "La Category est obligatoire"
	}
end
