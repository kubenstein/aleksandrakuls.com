require 'spec_helper'

describe 'Main page', type: :feature do
  let(:repo) { Ak::PagesRepository.new(adapter: DB_MEMORY_ADAPTER) }
  before { repo.clear }

  it 'marks side menu item correctly' do
    visit '/'
    expect_active_menu_item_to_be('Biografia')
  end

  it 'displays page correctly' do
    add_biography_text(:pl, text: 'biografia tekst')
    visit '/'
    expect(page.body).to have_content /biografia tekst/i
  end

  it 'displays page correctly in english' do
    add_biography_text(:en, text: 'biography text')
    visit '/'
    switch_langauge_to_english
    expect(page.body).to have_content /biography text/i
  end

  it 'displays page correctly when there is no article' do
    add_biography_text(:en, text: 'in english')
    visit '/'
    expect(page.body).not_to have_content /in english/i
  end

  private

  def add_biography_text(language, text:)
    page = Ak::Page.new(
      text: text,
      language: language
    )
    repo.add(:biography, page)
  end
end
