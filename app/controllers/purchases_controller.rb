class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item_id
  before_action :authenticate_purchase, only: [:index]

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :area_info_id, :municipality, :house_number, :buildingname, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    binding.pry
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def authenticate_purchase
    if Purchase.exists?(item_id: @item.id) || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
