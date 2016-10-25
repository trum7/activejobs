class Country < ApplicationRecord
  has_many :address
  has_many :order
end
