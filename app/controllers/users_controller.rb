class UsersController < ApplicationController
  def index
  @products = Product.all
  end
end