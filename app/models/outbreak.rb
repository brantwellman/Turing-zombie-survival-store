class Outbreak < ActiveRecord::Base
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :danger, presence: true

  before_validation :geocode
  geocoded_by :address
end
