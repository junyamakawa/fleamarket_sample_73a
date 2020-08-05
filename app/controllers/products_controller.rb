class ProductsController < ApplicationController

  def index 
  end

  def new
  end

  def destroy 
    product = @product.find(params[:id])
    product.destroy
  end
  
end
