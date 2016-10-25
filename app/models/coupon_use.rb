class CouponUse < ApplicationRecord
  belongs_to :customer
  belongs_to :coupon
  belongs_to :order
end
