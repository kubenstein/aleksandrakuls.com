require 'spec_helper'

describe 'Music page', type: :feature do
  let(:repo) { Ak::MusicRepository.new }
  before { repo.clear }

  it 'marks side menu item correctly' do
    visit '/music'
    expect_active_menu_item_to_be('Muzyka')
  end

  it 'displays page correctly' do
    add_music(:pl, title: 'title')
    visit '/music'
    expect(page.body).to have_content 'title'
  end

  it 'displays page correctly in english' do
    add_music(:en, title: 'title')
    visit '/music'
    switch_language_to_english
    expect(page.body).to have_content 'title'
  end

  private

  def add_music(language, title:)
    music = Ak::Music.new(
      title: title,
      yt_id: '',
      language: language
    )
    repo.add(music)
  end
end
