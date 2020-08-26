class Order < ApplicationRecord

	belongs_to :customer
	has_many :ordered_items, dependent: :destroy

	 enum payment_method: [ :クレジットカード決済, :銀行振り込み ]
	 enum status: [ :入金待ち, :入金確認, :製作中, :発送準備中, :発送済み ]

   #追加属性の定義
   attr_accessor :address_select
   attr_accessor :order_address

   #confirmページでの表示
   def address_all
   	 "#{postal_code} #{address} #{name}"
   end

   #注文総数量計算
   def total_quantity
      total = 0
      ordered_items.each do |ordered_item|
         total += ordered_item.quantity
      end
      total
   end


end
