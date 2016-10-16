require 'spec_helper'

describe 'Reviews page', type: :feature do
  before do
    visit '/reviews'
  end

  it 'displays page correctly' do
    expect(page.body).to have_content /Aleksandra Kuls i Justyna Danczowska tworzą doskonale rozumiejący się duet/i
    expect(page.body).to have_content /Hanna Milewska, Hi-Fi i Muzyka/i
  end

  it 'displays page correctly in english' do
    switch_langauge_to_english
    expect(page.body).to have_content /Aleksandra Kuls has managed to reflect in Brahms/i
    expect(page.body).to have_content /Anna Woźniakowska "Dziennik Polski"/i
  end

  it 'marks side menu item correctly' do
    expect_active_menu_item_to_be('Recenzje')
  end
end
