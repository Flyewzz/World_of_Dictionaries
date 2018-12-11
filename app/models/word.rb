# Words pair
class Word < ApplicationRecord
  before_save {self.russian = russian.downcase; self.english = english.downcase}
  belongs_to :dictionary
  validates :english, :russian, presence: true
  validates :english, format: {with: /\A[a-zA-Z]+\z/}
  validates :russian, format: {with: /\A[а-яА-Я]+\z/}
end
