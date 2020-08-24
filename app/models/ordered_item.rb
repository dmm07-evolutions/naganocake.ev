class OrderedItem < ApplicationRecord

	belongs_to :item
	belongs_to :order

	def subtotal
		subtotal = price * quantity
	end

end
