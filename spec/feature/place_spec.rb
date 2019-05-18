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
      fill_in('maps-location', with: 'ZOLA, Paul-Lincke-Ufer, Berlin, Deutschland')
      click_on 'Place erstellen'
      place = Place.last
      expect(place.name).to eq('Caro')
    end

    xit 'can create a new visit' do
      visit new_place_path
      fill_in('place_name', with: 'Caro')
      fill_in('maps-location', with: 'ZOLA, Paul-Lincke-Ufer, Berlin, Deutschland')
      fill_in('visits_date', with: '11.11.2020')
      click_on 'Place erstellen'
      visit = Visit.last
      expect(visit.date).to eq('Wed, 11 Nov 2020')
    end

    it 'can create a new visit associated to a place' do
      visit new_place_path
      fill_in('place_name', with: 'Caro')
      fill_in('maps-location', with: 'ZOLA, Paul-Lincke-Ufer, Berlin, Deutschland')
      fill_in('visits_date', with: '11.11.2020')
      click_on 'Place erstellen'
      visit = Visit.last
      place = Place.last
      expect(visit.place_id).to eq(place.id)
    end
  end
end