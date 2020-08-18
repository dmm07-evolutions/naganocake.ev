class Genre < ApplicationRecord
	# itemsのアソシエーション
	has_many :items, dependent: :destroy

	def persisted? ; false ; end
end
