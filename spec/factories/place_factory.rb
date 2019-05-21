FactoryBot.define do
  factory :place do
    name { 'TestPlace' }
    latitude { 1.5333 }
    longitude { 42.425 }
    location { 'test location' }
    rating { 4 }
  end
end
