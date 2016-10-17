require 'spec_helper'

describe 'Gallery page', type: :feature do
  let(:repo) { Ak::PhotosRepository.new(adapter: DB_MEMORY_ADAPTER) }
  before { repo.clear }

  it 'marks side menu item correctly' do
    visit '/gallery'
    expect_active_menu_item_to_be('Galeria')
  end

  it 'displays page correctly' do
    add_photo(:pl, file_name: 'gallery1.jpg')
    visit '/gallery'
    image = find('a[href~="/assets/images/gallery/gallery1.jpg"]')
    expect(image).to be_present
  end

  private

  def add_photo(language, file_name:)
    photo = Ak::Photo.new(
      file_name: file_name,
      language: language
    )
    repo.add_to_gallery(photo)
  end
end
