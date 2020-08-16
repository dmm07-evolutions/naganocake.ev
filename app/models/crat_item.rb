class CratItem < ApplicationRecord
	# customerのアソシエーション
	belongs_to :customer
end
