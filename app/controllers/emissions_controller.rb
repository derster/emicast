class EmissionsController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :show]
  	before_action :find_emission, only: [:show, :edit, :update, :destroy]
  	before_action :find_categories, only: [:new, :edit, :update]
  	before_filter :require_permission, only: [:edit]
	def index
		
	end

	def new
		@emission = current_admin.emissions.build
	end

	def dashboard
		@admin = Admin.find(current_admin.id)
		@emissions = Emission.all
	end

	def create
		@emission = current_admin.emissions.build(emission_params)
		@emission.category_id = params[:category_id]
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
		@emission.category_id = params[:category_id]
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

		def find_categories
			@categories = Category.all.map { |c| [c.name, c.id]  }
		end

		def find_emission
			@emission = Emission.find(params[:id])
		end 

		def emission_params
			params.require(:emission).permit(:title, :description, :facebook, :twitter, :youtube, :cover, :thumbnail, :category_id)
		end

		def require_permission
			if current_admin.id != @emission.admin_id
				redirect_to root_path, notice: "Vous êtes pas autoriser à acceder à cette page !"
			end
		end

end