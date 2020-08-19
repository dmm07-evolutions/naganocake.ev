class Item < ApplicationRecord
	# genreのアソシエーション
	belongs_to :genre
	# cart_itemsのアソシエーション
	has_many :cart_items, dependent: :destroy
	attachment :img_id


	def status_text
		if status == true
			"販売中"
		else
			"売り切れ"
		end
	end

	def price_tax
		price = price * 1.08
	end
end
