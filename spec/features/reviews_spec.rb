require 'spec_helper'

describe 'Reviews', type: :feature do
  before do
    visit '/reviews'
  end

  it 'displays page correctly' do
    expect(page.body).to have_content /Aleksandra Kuls i Justyna Danczowska tworzą doskonale rozumiejący się duet/i
    expect(page.body).to have_content /Hanna Milewska, Hi-Fi i Muzyka/i
  end

  it 'displays main page correctly in english' do
    click_link 'English'
    expect(page.body).to have_content /Aleksandra Kuls has managed to reflect in Brahms/i
    expect(page.body).to have_content /Anna Woźniakowska "Dziennik Polski"/i
  end

  it 'marks side menu item correctly' do
    within find('#menu .active') do
      expect(page.body).to have_content /Recenzje/i
    end
  end
end
