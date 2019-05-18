class Place < ApplicationRecord
  has_many :visits
  accepts_nested_attributes_for :visits
end
