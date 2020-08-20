class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items, dependent: :destroy

	enum payment_method:    [ :クレジットカード決済, :銀行振り込み ]
end
