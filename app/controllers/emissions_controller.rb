class EmissionsController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :show]
  	before_action :find_emission, only: [:show, :edit, :update, :destroy]

	def index
	end

	def new
		@emission = current_admin.emissions.build
	end

	def create
		@emission = current_admin.emissions.build(emission_params)
		if @emission.save
			redirect_to @emission
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @emission.update(emission_params)
			redirect_to @emission
		else
			render 'edit'
		end
	end

	def destroy
		@emission.destroy

		redirect_to root_path
	end

	private
		def find_emission
			@emission = Emission.find(params[:id])
		end 

		def emission_params
			params.require(:emission).permit(:title, :description, :facebook, :twitter, :youtube, :cover, :thumbnail)
		end
end
