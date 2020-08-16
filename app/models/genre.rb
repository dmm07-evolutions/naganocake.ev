class Genre < ApplicationRecord
	# itemsのアソシエーション
	has_many :items, dependent: :destroy
end
