class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :update]
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_edit, only: [:edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:itemname, :itemdescription, :category_id, :itemstatus_id, :burden_id, :area_info_id, :days_to_send_id, :price, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def authenticate_edit
    if Purchase.exists?(item_id: @item.id) || current_user.id != @item.user_id
      redirect_to root_path
    end
  end

end
