class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :country
  has_many :order
  has_many :customer_transaction
  ######################
  #     Validations    #
  ######################


  validates :address, presence: true
  validates :city, presence: true


end
