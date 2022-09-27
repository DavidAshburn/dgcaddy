class Course < ApplicationRecord
	belongs_to :user
	has_many :variants, dependent: :destroy
end
