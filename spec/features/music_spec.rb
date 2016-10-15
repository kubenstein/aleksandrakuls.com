require 'spec_helper'

describe 'Music', type: :feature do
  before do
    visit '/music'
  end

  it 'displays page correctly' do
    expect(page.body).to have_content /Ignacy Waghalter - Koncert skrzypcowy A-dur, op. 15, cz. 3/i
  end

  it 'displays main page correctly in english' do
    click_link 'English'
    expect(page.body).to have_content /Ignatz Waghalter: Concerto for Violin and Orchestra A major Op.15 p.3/i
  end

  it 'marks side menu item correctly' do
    within find('#menu .active') do
      expect(page.body).to have_content /Muzyka/i
    end
  end
end
