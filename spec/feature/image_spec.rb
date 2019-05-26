RSpec.describe 'Image (feature)', type: :feature do
  CTA_TEXT = 'Besuch anlegen'
  it 'can upload .jpg files' do
    visit new_place_path
    attach_file('visits_images', test_jpg)
    click_on CTA_TEXT
    expect(last_image_content_type).to eq('image/jpg')
  end

  it 'can upload .png files' do
    visit new_place_path
    attach_file('visits_images', test_png)
    click_on CTA_TEXT
    expect(last_image_content_type).to eq('image/png')
  end
end 

private

def test_jpg
  Rails.root + 'spec/fixtures/picture.jpg'
end

def test_png
  Rails.root + 'spec/fixtures/picture.png'
end

def last_image_content_type
  ActiveStorage::Blob.last.content_type
end
