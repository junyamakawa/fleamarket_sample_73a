class CreditCardsController < ApplicationController
  require "payjp" 

  def new
  end

  def create 
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params["payjp_token"].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした。"
    end

  end

  
end