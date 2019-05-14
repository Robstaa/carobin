RSpec.describe 'Helper Methods' do
  context 'Center' do
    it 'returns the correct longitude' do
      expect(HomeHelper::Center.longitude).to eq 1
    end

    it 'returns the correct latitude' do
      expect(HomeHelper::Center.latitude).to eq 1
    end
  end
end