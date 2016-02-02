module ApplicationHelper
	def  page_title(title)
		if(title.empty?)
			'Emicast - Réécouter les émissions de vos chaines préférées'
		else
			title
		end
	end
end
