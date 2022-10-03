class Course < ApplicationRecord
	belongs_to :user
	has_many :variants, dependent: :destroy
	has_many :cards
end
