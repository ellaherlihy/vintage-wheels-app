class Review < ApplicationRecord
  belongs_to :car

  validates :content, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 5, only_integer: true }
end
