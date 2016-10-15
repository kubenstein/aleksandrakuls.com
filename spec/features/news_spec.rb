require 'spec_helper'

describe 'News', type: :feature do
  before do
    visit '/'
  end

  it 'displays news correctly' do
    expect(page.body).to have_content /Płyta Aleksandry Kuls z utworami na skrzypce solo została wydana! /i
    image = find('img[title~="Płyta Aleksandry Kuls z utworami na skrzypce solo"]')
    expect(image).to be_present
  end

  it 'displays news correctly in english' do
    click_link 'English'
    expect(page.body).to have_content /New CD release/i
  end
end
