class OrderedItem < ApplicationRecord

	belongs_to :item
	belongs_to :order



	#enum production_status:    [ :制作不可, :制作待ち, :製作中, :製作完了 ]



	def subtotal
		subtotal = price * quantity
	end

end
