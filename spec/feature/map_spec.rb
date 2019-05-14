describe 'Google Maps view', type: :feature do
  it 'shows the map headline' do
    visit '/'
    expect(page).to have_content 'Maps'
  end
end