class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #courses and cards this user created
  has_many :courses, dependent: :destroy
  has_many :cards, dependent: :destroy

  #keys have course id's and the number of cards played there, for sorting and displaying courses
  has_many :coursekeys, dependent: :destroy

  has_many :disckeys, dependent: :destroy
end
