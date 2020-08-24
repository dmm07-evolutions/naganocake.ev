class Item < ApplicationRecord
	# genreのアソシエーション
	belongs_to :genre
	# cart_itemsのアソシエーション
	has_many :cart_items, dependent: :destroy
	has_many :ordered_items
	attachment :img


	def status_text
		if status == true
			"販売中"
		else
			"売り切れ"
		end
	end

		#消費税込みの単価
	def price_tax
		price_tax = price.to_i * 1.08
		#小数点以下を消す
		price_tax.round
	end

end
