FactoryBot.define do
  factory :visit do
    date { Date.today }
    notes { 'test notes' }
  end
end