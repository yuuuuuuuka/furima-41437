class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :destroy]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    return unless item.user == current_user

    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :price, :category_id, :prefecture_id, :shipping_location_id,
                                 :load_id, :item_situation_id).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def authorize_user
    return if @item.user == current_user && !@item.purchased?

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
