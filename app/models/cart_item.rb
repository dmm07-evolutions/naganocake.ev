class CartItem < ApplicationRecord
	# customerのアソシエーション
	belongs_to :customer
	belongs_to :item
end
