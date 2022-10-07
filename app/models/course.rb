class Course < ApplicationRecord
	has_many :variants, dependent: :destroy
	has_many :cards

	#seeded courses belong to user 0, others can be edited and deleted, but are only visible to the creator
	belongs_to :user
end
