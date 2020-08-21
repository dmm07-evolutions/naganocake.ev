class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items, dependent: :destroy

	enum payment_method:    [ :クレジットカード決済, :銀行振り込み ]
	enum address_select:    [ :ご自身の住所, :ご登録済みの住所, :新しいお届け先 ]
   

  def address_select
  end

end
