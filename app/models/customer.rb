class Customer < ApplicationRecord
  has_many :order
  has_many :cart
  has_many :couponUse
  has_many :address
  has_many :customerTransaction
  has_one :user

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :telephone, presence: true

end
