class ProductsController < ApplicationController

  before_action :set_parents, only: [:new, :create]
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @images = Image.where(product_id: @product[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def get_category_children
    respond_to do |format| 
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end

  def get_category_grandchildren
    respond_to do |format|
      format.html 
      format.json do
        @grandchildren = Category.find("#{params[:child_id]}").children
      end
    end
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :brand, :condition_id, :category_id, :delivery_cost_id, :region_id, :preparation_day_id, :price, images_attributes: [:src], categories_attributes: [:category_name]).merge(user_id: current_user.id)
  end

  def set_parents 
    @parents = Category.where(ancestry: nil)
  end

end
