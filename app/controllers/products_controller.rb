class ProductsController < ApplicationController

  def index 
    @products = Product.all
  end

  def new
  end

  def show
  end
  
end
