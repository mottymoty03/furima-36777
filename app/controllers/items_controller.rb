class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user)
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

  private
  def item_params
    params.require(:item).permit(:image, :itemname, :itemdescription, :category_id, :itemstatus_id, :burden_id, :area_info_id, :days_to_send_id, :price).merge(user_id: current_user.id)
  end

end
