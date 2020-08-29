class Genre < ApplicationRecord
	# itemsのアソシエーション
	has_many :items, dependent: :destroy
	#バリデーション
	validates :name, presence: true

end

