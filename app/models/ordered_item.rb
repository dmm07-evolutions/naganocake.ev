class OrderedItem < ApplicationRecord

	belongs_to :customer
	has_many :order_items, dependent: :destroy

	belongs_to :item
	belongs_to :order

end
