class PurchaserDelivery 
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address 
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

    validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z0-9]/, allow_blank: true }

  def save
    purchaser = Purchaser.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchaser_id: purchaser.id)
  end
  
end