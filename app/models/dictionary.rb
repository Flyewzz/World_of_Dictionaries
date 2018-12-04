class Dictionary < ApplicationRecord
  has_many :words, dependent: :destroy
end
