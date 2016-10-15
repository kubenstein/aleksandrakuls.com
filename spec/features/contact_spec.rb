require 'spec_helper'

describe 'Contact', type: :feature do
  before do
    visit '/contact'
  end

  it 'displays page correctly' do
    expect(page.body).to have_content /Aleksandra Kuls jest reprezentowana przez Stowarzyszenie im. Ludwiga van Beethovena./i
  end

  it 'displays main page correctly in english' do
    click_link 'English'
    expect(page.body).to have_content /Aleksandra Kuls is represented the Ludwig van Beethoven Association./i
  end

  it 'marks side menu item correctly' do
    within find('#menu .active') do
      expect(page.body).to have_content /Kontakt/i
    end
  end
end
