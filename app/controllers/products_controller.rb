class ProductsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create]

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
    if @product.update(product_params)
      redirect_to root_path
    else
      render_edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end
end

private

def product_params
  params.require(:product).permit(:name, :description, :category_id, :brand, :condition_id, :delivery_cost_id, :region_id, :preparation_day_id, :price, images_attributes: [:src, :_destroy, :id], categories_attributes: [:category_name]).merge(user_id: current_user.id)  
end

def set_product
  @product = Product.find(params[:id])
end
