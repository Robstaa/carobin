class Place < ApplicationRecord
  has_many :visits
  accepts_nested_attributes_for :visits
  validates :name, :latitude, :longitude, :location, presence: true
end
