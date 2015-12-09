class CategoriesController < ApplicationController
	before_action :authenticate_admin!
  	before_action :find_categories, only: [:edit, :update, :destroy]

	def new
		@category = current_admin.categories.build
	end

	def create
		@category = current_admin.categories.build(categories_params)
		if @category.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @category.update(categories_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@category.destroy

		redirect_to root_path
	end

	private

		def find_categories
			@category = Category.find(params[:id])
		end

		def categories_params
			params.require(:category).permit(:name)
		end
end
