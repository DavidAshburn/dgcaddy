class Card < ApplicationRecord
	belongs_to :variant
	belongs_to :course
	belongs_to :user
end
