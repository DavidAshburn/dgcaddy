class Course < ApplicationRecord
	has_many :variants, dependent: :destroy
	has_many :cards
end
