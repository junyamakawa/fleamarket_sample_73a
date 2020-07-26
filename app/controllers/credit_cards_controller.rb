class CreditCardsController < ApplicationController
  require "payjp" 
  before_action :move_to_new, only: [:buy, :pay]
  before_action :set_Payjp_key, only: [:create, :show, :destroy, :buy, :pay]

  def new
  end

  def create 
    

    if params["payjp_token"].blank?
      redirect_to new_credit_card_path , alert: "クレジットカードを登録できませんでした。"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id} 
      )

      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      @card.save

      redirect_to credit_card_path(current_user.id)
    end

  end

  def show
    @card = CreditCard.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "new" 
    else

      customer = Payjp::Customer.retrieve(@card.customer_id)

      @customer_card = customer.cards.retrieve(@card.card_id)

      @exp_month = @customer_card.exp_month.to_s

      @exp_year = @customer_card.exp_year.to_s.slice(2,3)
    end
  end

  def destroy
    @card = CreditCard.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "new" 
    else

      customer = Payjp::Customer.retrieve(@card.customer_id)

      customer.delete

      @card.delete

    end
  end

  def buy
    @product = Product.find(params[:product_id])


    if user_signed_in?
      if @product.status == "sale"
      @user = current_user
      @user.credit_cards.present?
      @card = CreditCard.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)
      else 
        redirect_to root_path,alert: "売り切れています"
      end


    end
  end

  def pay
    @product = Product.find(params[:product_id])

    @product.with_lock do
      if @product.status == "sale"
        @card = CreditCard.find_by(user_id: current_user.id)
        charge = Payjp::Charge.create(
          amount: @product.price,
          customer: Payjp::Customer.retrieve(@card.customer_id),
          currency: 'jpy'
        )
        @product.update( status: 1 )
        redirect_to root_path, alert: "購入しました。"
      else
        redirect_to root_path, alert: "売り切れています。"
      end
    end
  end

  def set_Payjp_key
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
  end

  def move_to_new
    redirect_to new_credit_card_path unless current_user.credit_cards.present?
  end
end
