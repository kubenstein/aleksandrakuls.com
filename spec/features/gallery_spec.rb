require 'spec_helper'

describe 'Gallery', type: :feature do
  before do
    visit '/gallery'
  end

  it 'displays page correctly' do
    image = find('a[href~="/assets/images/gallery/gallery1.jpg"]')
    expect(image).to be_present
  end

  it 'marks side menu item correctly' do
    within find('#menu .active') do
      expect(page.body).to have_content /Galeria/i
    end
  end
end
