class CustomerTransaction < ApplicationRecord
  belongs_to :order
  belongs_to :customer
  belongs_to :address
end
