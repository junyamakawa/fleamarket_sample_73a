class ProductsController < ApplicationController

  def index 
    @products = Product.where(status: 0)
  end

  def new
  end

  def show
  end
  
end
