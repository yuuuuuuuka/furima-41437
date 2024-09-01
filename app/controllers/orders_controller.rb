class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :authorize_user, only: [:index, :create]
  before_action :move_to_root_if_invalid_access, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address_form = OrderAddressForm.new
  end

  def create
    @order_address_form = OrderAddressForm.new(order_params)
    if @order_address_form.valid?
      pay_item
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      @order_address_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']

      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def authorize_user
    return unless @item.user == current_user

    redirect_to root_path
  end

  def order_params
    params.require(:order_address_form).permit(:postal_code, :city, :address, :building, :phone_number, :prefecture_id).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_if_invalid_access
    return unless current_user == @item.user || @item.purchased?

    redirect_to root_path
  end
end
