describe 'Place (feature)', type: :feature do
  CTA_TEXT = 'Besuch anlegen'
  context 'new view' do
    it 'is accessible from the homepage' do
      visit root_path
      click_link 'Neuer Eintrag'
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
      click_on CTA_TEXT
      last_place = Place.last
      expect(last_place.name).to eq('Caro')
    end

    it 'can create a new visit' do
      visit new_place_path
      fill_in('place_name', with: 'Caro')
      fill_in('maps-location', with: 'ZOLA, Paul-Lincke-Ufer, Berlin, Deutschland')
      fill_in('visits_date', with: '11.11.2020')
      click_on CTA_TEXT
      last_visit = Visit.last
      date = DateService.parse_date('Wed, 11 Nov 2020')
      expect(last_visit.date).to eq(date)
    end

    it 'can create a new visit associated to a place' do
      visit new_place_path
      fill_in('place_name', with: 'Caro')
      fill_in('maps-location', with: 'ZOLA, Paul-Lincke-Ufer, Berlin, Deutschland')
      fill_in('visits_date', with: '11.11.2020')
      click_on CTA_TEXT
      last_visit = Visit.last
      last_place = Place.last
      expect(last_visit.place_id).to eq(last_place.id)
    end

    it 'can create a new vine associated to a visit' do
      visit new_place_path
      fill_in('place_name', with: 'Caro')
      fill_in('maps-location', with: 'ZOLA, Paul-Lincke-Ufer, Berlin, Deutschland')
      fill_in('visits_date', with: '11.11.2020')
      fill_in('vines_name', with: 'testvine')
      fill_in('vines_rating', with: 4)
      click_on CTA_TEXT
      last_visit = Visit.last
      last_vine = Vine.last
      expect(last_vine.visit_id).to eq(last_visit.id)
    end
  end

  context 'show view' do
    let!(:place) { create :place }
    let!(:visit_ex) { create :visit, place_id: place.id }
    let!(:vine_ex) { create :vine, visit_id: visit_ex.id }

    before(:each) do
      visit "/places/#{place.id}"
    end

    it 'successfully renders' do
      expect(page.status_code).to eq(200)
    end

    it 'shows the name' do
      expect(page).to have_content('TestPlace')
    end

    it 'shows the location' do
      expect(page).to have_content('test location')
    end

    it 'shows the rating' do
      expect(page).to have_content('4')
    end

    context 'visit' do
      it 'has a date' do
        visit_date = DateService.format_date(visit_ex.date)
        expect(page).to have_content(visit_date)
      end

      it 'has notes' do
        expect(page).to have_content('test notes')
      end
    end

    context 'vine' do
      it 'has a name' do
        expect(page).to have_content('testvine')
      end

      it 'has a rating' do
        expect(page).to have_content('3')
      end
    end
  end
end
