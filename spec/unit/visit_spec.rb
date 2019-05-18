RSpec.describe 'Visit' do
  let(:place) { Place.create!(name: 'TestPlace') }
  let(:visit) { Visit.create!(date: Date.today, notes: 'test notiz', place: place) }
  it 'has a date' do
    expect(visit.date).to eq(Date.today)
  end

  it 'has notes' do
    expect(visit.notes).to eq('test notiz')
  end
end
