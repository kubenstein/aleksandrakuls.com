require 'spec_helper'

describe 'Music page', type: :feature do
  before do
    visit '/music'
  end

  it 'displays page correctly' do
    expect(page.body).to have_content /Ignacy Waghalter - Koncert skrzypcowy A-dur, op. 15, cz. 3/i
  end

  it 'displays page correctly in english' do
    switch_langauge_to_english
    expect(page.body).to have_content /Ignatz Waghalter: Concerto for Violin and Orchestra A major Op.15 p.3/i
  end

  it 'marks side menu item correctly' do
    expect_active_menu_item_to_be('Muzyka')
  end
end
