require 'spec_helper'

describe 'Concerts page', type: :feature, js: true do
  let(:repo) { Ak::ConcertsRepository.new }
  before { repo.clear }

  it 'marks side menu item correctly' do
    visit '/concerts'
    expect_active_menu_item_to_be('Koncerty')
  end

  it 'displays page correctly' do
    add_concert(:pl, date: '2116-11-20', text: 'concert in polish')

    visit '/concerts'
    expect(page.body).to have_content '2116-11-20concert in polish'
  end

  it 'displays page correctly in english' do
    add_concert(:en, date: '2116-11-20', text: 'concert in english')

    visit '/concerts'
    switch_language_to_english
    expect(page.body).to have_content '2116-11-20concert in english'
  end

  it 'displays incoming only page correctly' do
    add_concert(:pl, date: '2116-11-20', text: 'concert')
    add_concert(:pl, date: '1116-11-20', text: 'concert in past')

    visit '/concerts'
    display_only_future_concerts
    expect(page.body).to have_content '2116-11-20concert'
    expect(page.body).not_to have_content '1410-07-15concert in past'
  end

  it 'displays incoming only page correctly in english' do
    add_concert(:en, date: '2116-11-20', text: 'concert')
    add_concert(:en, date: '1116-11-20', text: 'concert in past')

    visit '/concerts'
    display_only_future_concerts
    switch_language_to_english
    expect(page.body).to have_content '2116-11-20concert'
    expect(page.body).not_to have_content '1410-07-15concert in past'
  end

  private

  def display_only_future_concerts
    click_link 'pokaż tylko przyszłe koncerty'
  end

  def add_concert(language, date:, text:)
    concert = Ak::Concert.new(
      text: text,
      date: date,
      language: language
    )
    repo.add(concert)
  end
end
