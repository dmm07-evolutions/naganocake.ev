class CartItem < ApplicationRecord
	# customerのアソシエーション
	belongs_to :customer
	belongs_to :item

	#消費税込みの単価
	def price_tax
		price_tax = item.price.to_i * 1.08
		price_tax.round
	end

	#消費税込みの小計（単価xx数量）
	def subtotal
		subtotal = price_tax.to_i * quantity
	end

end
