class UsersController < ApplicationController
  def index
    @products = Product.where(status: 0)
    @new_products = @products.last(4)
  end

  def show

  end
end