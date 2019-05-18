require 'rails_helper'

RSpec.describe 'Services' do
  describe 'CenterService' do
    context '#longitude' do
      it 'returns the correct longitude' do
        expect(CenterService.longitude).to eq 13.397017
      end
    end

    context '#latitude' do
      it 'returns the correct latitude' do
        expect(CenterService.latitude).to eq 52.502973
      end
    end
  end

  describe 'DateService' do
    context '#parse_date' do
      it 'returns a date' do
        date = DateService.parse_date('2019-05-18')
        expect(date).to be_a(Date)
      end
    end

    context '#format_date' do
      it 'returns the correct date format' do
        date = DateService.parse_date('2019-05-18')
        expect(DateService.format_date(date)).to eq('Samstag, 18. Mai 2019')
      end
    end
  end
end
