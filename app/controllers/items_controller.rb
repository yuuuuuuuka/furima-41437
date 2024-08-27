class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :edit, :update]
  before_action :uthorize_user, only: [:edit]
  befoer_action :set_item, only: [:show, :edit]
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
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destory
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

  def uthorize_user
    @item = Item.find(params[:id])
    return if @item.user == current_user

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
