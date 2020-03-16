class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all
	end


	def show
	end


	def create
		@category = Category.new(category_params)
		respond_to do |format|
	    if @category.save
	        format.html { redirect_to Category, notice: 'category was successfully created.' }
	        format.json { render :show, status: :created, location: @category }
	      		else
	        		format.html { render :new }
	        		format.json { render json: @category.errors, status: :unprocessable_entity }
	    		end
    	end

	end


	def edit
	end


	def new
		@category = Category.new
	end


	def update
		@category.update(category_params)
		@category.save
	end


	def destroy
		@category.destroy
		respond_to do |format|
      					format.html { redirect_to categories_url method:'get' , notice: 'User was successfully destroyed.' }
      					format.json { head :no_content }
  					end			
	end



	def category_params
	
		params.require(:category).permit(:name, :image)
	end


	def set_category

		@category = Category.find_by_id(params[:id])
	end
end
