class ProductsController < ApplicationController

  def index 
  end

  def new
    @product = Product.new
    @product.images.new
    @product.categories.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
      logger.debug @product.errors.inspect
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

private

def product_params
  params.require(:product).permit(:name, :description, :category_id, :brand, :condition_id, :delivery_cost_id, :region_id, :preparation_day_id, :price, images_attributes: [:src], categories_attributes: [:category_name]).merge(user_id: current_user.id)  
end
  
