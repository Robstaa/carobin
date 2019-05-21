# frozen_string_literal: true

RSpec.describe 'Place (model)' do
  let(:place) { create(:place) }
  let(:visit) { create(:visit, place_id: place.id) }

  it 'has a name' do
    expect(place.name).to eq('TestPlace')
  end

  it 'has a latitude' do
    expect(place.latitude).to eq(1.5333)
  end

  it 'has a longitude' do
    expect(place.longitude).to eq(42.425)
  end

  it 'has a location' do
    expect(place.location).to eq('test location')
  end

  context 'validations' do
    it 'validate that there is a name for an instance' do
      place_without_name = build(:place, name: nil)
      expect(place_without_name.save).to be_falsey
    end

    it 'validate that there is a latitude for an instance' do
      place_without_latitude = build(:place, latitude: nil)
      expect(place_without_latitude.save).to be_falsey
    end

    it 'validate that there is a longitude for an instance' do
      place_without_latitude = build(:place, longitude: nil)
      expect(place_without_latitude.save).to be_falsey
    end

    it 'validate that there is a location for an instance' do
      place_without_location = build(:place, location: nil)
      expect(place_without_location.save).to be_falsey
    end
  end
end
