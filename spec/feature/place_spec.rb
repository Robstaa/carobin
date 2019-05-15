describe 'Place', type: :feature do
  context 'new page' do
    it 'is accessible from the homepage' do
      visit root_path
      click_on 'Neuer Ort'
      expect(page).to have_current_path(new_place_path)
    end

    it 'can be left to the homepage' do
      visit new_place_path
      click_link 'Zurück'
      expect(page).to have_current_path(root_path)
    end

    it 'can create a new place' do
      visit new_place_path
      fill_in('place_name', with: 'Caro')
      click_on 'Create Place'
      place = Place.last
      expect(place.name).to eq('Caro')
    end
  end
end