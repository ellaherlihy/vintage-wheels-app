class Car < ApplicationRecord
  belongs_to :user

  validates :brand, :model, presence: true
end
