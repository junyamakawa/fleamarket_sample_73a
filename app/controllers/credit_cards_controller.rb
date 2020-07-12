class CreditCardsController < ApplicationController
  require "payjp" 

  def new
  end

  def create 
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
  end
end