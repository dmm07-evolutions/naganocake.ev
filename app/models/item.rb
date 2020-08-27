class Item < ApplicationRecord
	# genreのアソシエーション
	belongs_to :genre
	# cart_itemsのアソシエーション
	has_many :cart_items, dependent: :destroy
	has_many :ordered_items
	attachment :img
	#バリデーション
	validates :genre_id, presence: true
	validates :name, presence: true, length: {maximum: 15}
	validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 1 }
	validates :explanation, length: {maximum: 500}


	#商品ステータス表示
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

	def self.search(search)
	  if search
	  	@items = Item.where("name LIKE?","%#{search}%")
	  else
	  	@items = Item.all
	  end
	end

end
