class Place < ApplicationRecord
  nilify_blanks

  has_many :visits
  accepts_nested_attributes_for :visits
  validates :name, :location, presence: true
  validates :location, uniqueness: { message: :place_not_unique }
end
