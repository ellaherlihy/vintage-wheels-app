class Car < ApplicationRecord
  belongs_to :user
  validates :brand, :model, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :reviews
end
