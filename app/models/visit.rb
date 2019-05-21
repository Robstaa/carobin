class Visit < ApplicationRecord
  belongs_to :place
  has_many :vines
  has_many_attached :images
end
