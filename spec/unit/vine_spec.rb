RSpec.describe 'Vine (unit)' do
  let(:place) { create(:place) }
  let(:visit) { create(:visit, place_id: place.id)}
  let(:vine) { create(:vine, visit_id: visit.id) }

  it 'has a name' do
    expect(vine.name).to eq('testvine')
  end

  it 'has a rating' do
    expect(vine.rating).to eq(3)
  end

  it 'is associated to a visit' do
    expect(vine.visit.id).to eq(visit.id)
  end
end
