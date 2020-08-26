class ProductsController < ApplicationController
  # before_action :move_to_login, only: [:new]

  before_action :set_product, only: [:show, :destroy, :edit, :update]
  before_action :move_to_index, only: [:edit]
  
  def index
    @products = Product.where(status: 0)
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
    @image_first = @images.first
  end

  def edit
    @images = Image.where(product_id: @product[:id])
    @image_first = @images.first
  end

  def update
    if product_params[:images_attributes].nil?
      flash.now[:alert] = '更新できませんでした。画像を1枚以上入れてください。'
      render :edit
    else
      exit_ids = []
      product_params[:images_attributes].each do |a,b|
        exit_ids << product_params[:images_attributes].dig(:"#{a}",:id).to_i
      end
      ids = Image.where(product_id: params[:id]).map{|image| image.id }
      delete__db = ids - exit_ids
      Image.where(id:delete__db).destroy_all
      @product.touch
      if @product.update(product_params)
        redirect_to product_path(@product.id)
      else
        flash[:alert] = '更新できませんでした'
        redirect_to edit_product_path(@product.id)
      end
    end
  end

  def destroy
      if @product.user_id == current_user.id && @product.destroy
        redirect_to products_path, method: :get,  notice: '商品を削除しました'
      end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :brand, :condition_id, :delivery_cost_id, :region_id, :preparation_day_id, :price, images_attributes: [:src, :_destroy, :id], categories_attributes: [:category_name]).merge(user_id: current_user.id)  
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? || user_signed_in? && @product.user_id == current_user.id
  end
end
