class Place < ApplicationRecord
  before_save :nil_if_blank

  has_many :visits
  accepts_nested_attributes_for :visits
  validates :name, :location, presence: true
  validates :location, uniqueness: true
end
