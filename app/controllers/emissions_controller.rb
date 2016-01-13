class EmissionsController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :show, :search]
  	before_action :find_emission, only: [:show, :edit, :update, :destroy]
  	before_action :find_categories, only: [:new, :edit, :update]
  	before_filter :require_permission, only: [:edit]
	
	def index
	  	if params[:category].blank?
	      @emissions = Emission.all.order("created_at DESC")
	    else
	      @category_id = Category.find_by(name: params[:category]).id
	      @emissions = Emission.where(:category_id => @category_id).order("created_at DESC")
	    end
	end

	def search
		if params[:search].present?
		  @emissions = Emission.search(params[:search])
		else
		  @emissions = Emission.all.order("created_at DESC")
		end
	end

	def new
		@emission = current_admin.emissions.build
	end

	def dashboard
		@admin = Admin.find(current_admin.id)
		@emissions = Emission.where(admin_id: current_admin.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
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
		@admin = Admin.find(@emission.admin_id)
		@episodes = Episode.where(emission_id: @emission.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
		@emissions = Emission.where(admin_id: @admin.id).order("created_at DESC").limit(3).reject{ |e| e.id == @emission.id}
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