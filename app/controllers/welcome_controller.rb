class WelcomeController < ApplicationController
	def index
		@episodes = Episode.all.order("created_at DESC").limit(8)
		@emissions = Emission.all.order("created_at DESC").limit(4)
	end 

	def episodes
	    @episodes = Episode.all.order("created_at DESC")
	end

	def emission
	    @emissions = Emission.all.order("created_at DESC")
	end
end
