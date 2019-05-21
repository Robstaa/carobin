RSpec.describe 'Visit' do
  let(:place) { create(:place) }
  let(:visit) { create(:visit, place_id: place.id) }
  it 'has a date' do
    expect(visit.date).to eq(Date.today)
  end

  it 'has notes' do
    expect(visit.notes).to eq('test notes')
  end
end
