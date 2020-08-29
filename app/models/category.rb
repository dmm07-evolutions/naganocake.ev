class Category < ApplicationRecord
	has_many :questionnaires, dependent: :destroy
end
