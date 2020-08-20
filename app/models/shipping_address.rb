class ShippingAddress < ApplicationRecord

	belongs_to :customer

	validates :postcode, presence: true
	validates :address, presence: true
	validates :destination, presence: true
end
