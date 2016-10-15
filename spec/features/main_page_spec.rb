require 'spec_helper'

describe 'Main Page', type: :feature do
  before do
    visit '/'
  end

  it 'displays main page correctly' do
    expect(page.body).to have_content /Aleksandra Kuls urodziła się w 1991 roku./i
  end

  it 'displays main page correctly in english' do
    click_link 'English'
    expect(page.body).to have_content /Aleksandra Kuls was born in 1991./i
  end

  it 'marks side menu item correctly' do
    within find('#menu .active') do
      expect(page.body).to have_content /Biografia/i
    end
  end
end
