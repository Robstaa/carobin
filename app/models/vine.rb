class Vine < ApplicationRecord
  nilify_blanks
  
  belongs_to :visit
end
