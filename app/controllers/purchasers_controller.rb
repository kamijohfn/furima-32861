class PurchasersController < ApplicationController
  def index
    @purchaser_delivery = PurchaserDelivery.new
  end

  def create
    @purchaser_delivery = PurchaserDelivery.new(purchaser_params)
    if  @purchaser_delivery.valid? 
        binding.pry
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
        Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: purchaser_params[:token], 
        currency: 'jpy'
      )
        @purchaser_delivery.save
        redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchaser_params
    params.require(:purchaser_delivery).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end


end
