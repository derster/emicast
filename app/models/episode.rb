class Episode < ActiveRecord::Base
	belongs_to :emission

	validates :title, presence:{
		message:"Le titre est obligatoire"
	}

	validates :description, presence:{
		message:"la description est obligatoire"
	}
end
