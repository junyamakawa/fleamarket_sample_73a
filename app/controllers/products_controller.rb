class ProductsController < ApplicationController

  def index 
  end

  def new
  end

  def show
  end


  def destroy 
    product = @product.find(params[:id])
    product.destroy
    redirect_to product_path(params[:user_id]), notice: "商品を削除しました"
  end
  
end
