# frozen_string_literal: true

RSpec.describe 'Place' do
  let(:place) { Place.create!(name: 'Mein Restaurant', latitude: 1.5333, longitude: 42.425) }
  it 'has a name' do
    expect(place.name).to eq('Mein Restaurant')
  end

  it 'has a latitude' do
    expect(place.latitude).to eq(1.5333)
  end

  it 'has a longitude' do
    expect(place.longitude).to eq(42.425)
  end
end
