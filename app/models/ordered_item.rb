class OrderedItem < ApplicationRecord

	belongs_to :item
	belongs_to :order

	enum production_status:    [ :製作不可, :製作待ち, :製作中, :製作完了 ]

	#小計計算
	def subtotal
		subtotal = price * quantity
	end

end
