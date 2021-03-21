class PurchasersController < ApplicationController
  def index
    @purchaser_delivery = PurchaserDelivery.new
  end

  def create
    @purchaser_delivery = PurchaserDelivery.new(purchaser_params)
    if  @purchaser_delivery.valid? 
        @purchaser_delivery.save
        redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchaser_params
    params.permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number)
  end


end
