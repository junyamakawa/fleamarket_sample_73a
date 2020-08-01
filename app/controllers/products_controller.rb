class ProductsController < ApplicationController
  before_action :move_to_login, only: [:new]

  def index 
    @products = Product.where(status: 0)
  end

  def new
  end

  def show
  end
  
  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
