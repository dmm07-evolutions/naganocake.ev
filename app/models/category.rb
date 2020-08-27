class Category < ApplicationRecord
	has_many :categories, dependent: :destroy
end
