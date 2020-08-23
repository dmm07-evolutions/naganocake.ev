class ShippingAddress < ApplicationRecord

	belongs_to :customer

	# validates :postcode, presence: true
	# validates :address, presennce: true
	# validates :destination, presence: true


	def all_address
    "#{postcode} #{address} #{destination}"
  	end

  	#shipping_addressesテーブルの:postcode,:address,:destinationカラムのデーターを一つにまとめる
  	def registered_address
  		"#{postcode} #{address} #{destination}"
  	end

end
