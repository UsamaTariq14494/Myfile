class ProductsController < ApplicationController
	before_action  :set_category	
	before_action :set_product,  only: [:show, :edit, :update, :destroy]


	def index
		@products = []
		if !@category.nil?
			@products = @category.products
		end
	end


	def show

	end


	def create
		@product = @category.products.create(product_params)
		respond_to do|format|
		if @product  

        format.html {redirect_to  category_products_path(@category), notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
	end


	def edit
	end


	def new
		@product = @category.products.build
	end


	def update
		@product.update(product_params)
		respond_to do|format|
				if @product.save  
						format.html {redirect_to  category_products_path(@category), notice: 'Product was successfully created.' }		
      				else
        				format.html { render :new }
      			end
      				
		end
	end


	def destroy
		@product.destroy
		respond_to do |format|
    		if @product
      			format.html { redirect_to category_products_path(@category), notice: 'Category was successfully destroyed.' }
				end
		end
	end



	def product_params
		params.require(:product).permit(:category_id, :name, :price, images: [])
	end


	def set_category
		@category = Category.find_by_id(params[:category_id])
	end


	def set_product
		@product = Product.new
		if !@product.nil?
			@product = @category.products.find_by_id(params[:id])
		end
	end
end