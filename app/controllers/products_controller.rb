class ProductsController < ApplicationController

  def index 
  end

  def new
  end

  def show
    @product = Product.find(params[:id])
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :description, :brand, :condition_id, :delivery_cost_id, :region_id, :preparation_day_id, :price, :user_id, :status)
  end
end