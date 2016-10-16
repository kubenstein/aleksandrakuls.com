require 'spec_helper'

describe 'News', type: :feature do
  before do
    visit '/'
  end

  it 'are being displayed correctly' do
    expect(page.body).to have_content /Płyta Aleksandry Kuls z utworami na skrzypce solo została wydana! /i
    expect(
      find('img[title~="Płyta Aleksandry Kuls z utworami na skrzypce solo"]')
    ).to be_present
  end

  it 'are being displayed correctly in english' do
    switch_langauge_to_english
    expect(page.body).to have_content /New CD release/i
  end
end
