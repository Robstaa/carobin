class Visit < ApplicationRecord
  before_save :nil_if_blank

  belongs_to :place
  has_many :vines
  has_many_attached :images
  validates :images, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
end
