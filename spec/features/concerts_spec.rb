require 'spec_helper'

describe 'Concerts page', type: :feature, js: true do
  before do
    visit '/concerts'
  end

  it 'marks side menu item correctly' do
    expect_active_menu_item_to_be('Koncerty')
  end

  it 'displays page correctly' do
    expect(page.body).to have_content past_concert
  end

  it 'displays page correctly in english' do
    switch_langauge_to_english
    expect(page.body).to have_content past_concert_in_english
  end

  it 'displays incomming only page correctly' do
    display_only_future_concerts
    expect(page.body).to have_content future_concert
    expect(page.body).not_to have_content past_concert
  end

  it 'displays incomming only page correctly in english' do
    display_only_future_concerts
    switch_langauge_to_english
    expect(page.body).to have_content future_concert_in_english
    expect(page.body).not_to have_content past_concert_in_english
  end

  private

  def display_only_future_concerts
    click_link 'pokaż tylko przyszłe koncerty'
  end

  def future_concert
    /2016-11-20Katowice, Międzynarodowy Festiwal Muzyki Kameralnej Kwartet Śląski i jego goście, Partita na skrzypce i fortepian Eugeniusza Knapika, wykonanie z kompozytorem/i
  end

  def future_concert_in_english
    /2016-11-20Katowice, International Chamber Music Festival 'The Silesian String Quartet and guests', Eugeniusz Knapik - Partita for violin and piano, performance with the composer/i
  end

  def past_concert
    /2012-08-05Curitiba-Brazylia/i
  end

  def past_concert_in_english
    /2012-08-05Curitiba-Brasil/i
  end
end
