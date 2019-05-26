class Visit < ApplicationRecord
  nilify_blanks
  
  belongs_to :place
  has_many :vines
  has_many_attached :images
  validates :images, attached: false, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
end
