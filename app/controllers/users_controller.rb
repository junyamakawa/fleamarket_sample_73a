class UsersController < ApplicationController
  def index
    @new_products = Product.last(4)
  end

  def show

  end
end