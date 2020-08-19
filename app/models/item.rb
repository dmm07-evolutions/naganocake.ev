class Item < ApplicationRecord
	# genreのアソシエーション
	belongs_to :genre
	# cart_itemsのアソシエーション
	has_many :cart_items, dependent: :destroy
	attachment :img


	def status_text
		if status == true
			"販売中"
		else
			"売り切れ"
		end
	end
end
