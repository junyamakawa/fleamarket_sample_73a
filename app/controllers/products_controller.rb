class ProductsController < ApplicationController

  def index 
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create 
    @product = Product.new(product_params)
    # binding.pry
    @product.save!
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :brand, :condition_id, :delivery_cost, :region_id, :preparation_day_id, :price, images_attributes: [:src]).merge(user_id: current_user.id)
  end

end
