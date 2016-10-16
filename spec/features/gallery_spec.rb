require 'spec_helper'

describe 'Gallery page', type: :feature do
  before do
    visit '/gallery'
  end

  it 'displays page correctly' do
    expect(
      find('a[href~="/assets/images/gallery/gallery1.jpg"]')
    ).to be_present
  end

  it 'marks side menu item correctly' do
    expect_active_menu_item_to_be('Galeria')
  end
end
