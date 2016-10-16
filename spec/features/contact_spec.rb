require 'spec_helper'

describe 'Contact page', type: :feature do
  before do
    visit '/contact'
  end

  it 'displays page correctly' do
    expect(page.body).to have_content /Aleksandra Kuls jest reprezentowana przez Stowarzyszenie im. Ludwiga van Beethovena./i
  end

  it 'displays page correctly in english' do
    switch_langauge_to_english
    expect(page.body).to have_content /Aleksandra Kuls is represented the Ludwig van Beethoven Association./i
  end

  it 'marks side menu item correctly' do
    expect_active_menu_item_to_be('Kontakt')
  end
end
