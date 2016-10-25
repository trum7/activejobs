class Order < ApplicationRecord
  belongs_to :OrderStatus
  belongs_to :country
  belongs_to :customer
  belongs_to :address
  has_many :line_product
  belongs_to :confirmation_order
  has_one :return
  belongs_to :coupon_use
end
