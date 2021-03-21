class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day

  belongs_to :user
  has_one :purchaser
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description

    with_options numericality: { other_than: 1 } do
      validates :category_id 
      validates :status_id 
      validates :delivery_fee_id
      validates :area_id
      validates :day_id 
    end

    validates :price, format: {with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image
  end

  
end
