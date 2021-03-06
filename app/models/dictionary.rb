# Dictionary
class Dictionary < ApplicationRecord
  has_many :words, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: {maximum: 60}, format: {with: /\A[a-zA-Zа-яА-Я]+\z/}
end
