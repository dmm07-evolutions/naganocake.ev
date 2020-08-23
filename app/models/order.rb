class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items, dependent: :destroy

	 enum payment_method:    [ :クレジットカード決済, :銀行振り込み ]
	# enum address_select:    [ :ご自身の住所, :ご登録済みの住所, :新しいお届け先 ]

   #追加属性の定義
   attr_accessor :address_select
   attr_accessor :order_address

   #confirmページでの表示
   def address_all
   	 "#{postal_code} #{address} #{name}"
   end


end
