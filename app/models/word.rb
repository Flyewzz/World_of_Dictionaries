class Word < ApplicationRecord
  before_save {self.russian = russian.downcase; self.english = english.downcase}
  belongs_to :dictionary
  validates :english, :russian, presence: true
  validates :english, format: {with: /\A[a-z]+\z/}
  validates :russian, format: {with: /\A[а-я]+\z/}
end
