class CartItem < ApplicationRecord
	# customerのアソシエーション
	belongs_to :customer
	belongs_to :item

	validates :customer_id, presence: true
	validates :item_id, presence: true
	#個数が１以上であるか
	validates :quantity, presence: true, :numericality => { :greater_than_or_equal_to => 1 }

	#消費税込みの単価
	def price_tax
		price_tax = item.price.to_i * 1.08
		#小数点以下を消す
		price_tax.round
	end

	#消費税込みの小計（単価x数量）
	def subtotal
		subtotal = price_tax.to_i * quantity
	end

end
