class ShippingAddress < ApplicationRecord

	belongs_to :customer

  validates :customer_id, presence: true
	validates :postcode, presence: true
	validates :address, presence: true
	validates :destination, presence: true
  validates :address, uniqueness: { scope: [:postcode, :destination] }


  #郵便番号、住所、宛先をまとめる
	def all_address
    "#{postcode} #{address} #{destination}"
  end

  	#shipping_addressesテーブルの:postcode,:address,:destinationカラムのデーターを一つにまとめる
  def registered_address
  	"#{postcode} #{address} #{destination}"
  end

end
