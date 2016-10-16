require 'spec_helper'

describe 'Concerts', type: :feature, js: true do
  before do
    visit '/concerts'
  end

  it 'marks side menu item correctly' do
    within find('#menu .active') do
      expect(page.body).to have_content /Koncerty/i
    end
  end

  it 'displays page correctly' do
    expect(page.body).to have_content /2012-08-05Curitiba-Brazylia, H.Wieniawski - Koncert skrzypcowy d-moll, ORQUESTRA SINFÔNICA DO PARANÁ, dyrygent: Antoni Wit./i
  end

  it 'displays main page correctly in english' do
    click_link 'English'
    expect(page.body).to have_content /2012-08-05Curitiba-Brasil, H. Wieniawski – Concerto for Violin D-minor, ORQUESTRA SINFÔNICA DO PARANÁ, conductor: Antoni Wit./i
  end

  it 'displays incomming only page correctly' do
    click_link 'pokaż tylko przyszłe koncerty'
    expect(page.body).to have_content /2016-11-20Katowice, Międzynarodowy Festiwal Muzyki Kameralnej Kwartet Śląski i jego goście, Partita na skrzypce i fortepian Eugeniusza Knapika, wykonanie z kompozytorem/i
    expect(page.body).not_to have_content /2012-08-05Curitiba-Brazylia/i
  end

  it 'displays incomming only page correctly in english' do
    click_link 'pokaż tylko przyszłe koncerty'
    click_link 'English'
    expect(page.body).to have_content /2016-11-20Katowice, International Chamber Music Festival 'The Silesian String Quartet and guests', Eugeniusz Knapik - Partita for violin and piano, performance with the composer/i
    expect(page.body).not_to have_content /2012-08-05Curitiba-Brazylia/i
  end
end
