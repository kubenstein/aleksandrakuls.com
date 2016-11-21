require 'spec_helper'

describe 'News', type: :feature do
  let(:repo) { Ak::NewsRepository.new }
  before { repo.clear }

  it 'are being displayed correctly' do
    add_news(:pl, text: 'content')
    visit '/'
    expect(page.body).to have_content 'content'
    image = find('img[title~="content"]')
    expect(image).to be_present
  end

  it 'are being displayed correctly in english' do
    add_news(:en, text: 'english content')
    visit '/'
    switch_language_to_english
    expect(page.body).to have_content 'english content'
  end

  private

  def add_news(language, text:)
    news = Ak::News.new(
      text: text,
      image: 'news/bethoven_brahms_massenet.jpg',
      language: language
    )
    repo.add(news)
  end
end
