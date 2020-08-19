class Item < ApplicationRecord
	# genreのアソシエーション
	belongs_to :genre
	# cart_itemsのアソシエーション
	has_many :cart_items, dependent: :destroy
	attachment :img_id
end
