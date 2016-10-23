require 'spec_helper'

describe 'Contact page', type: :feature do
  let(:repo) { Ak::PagesRepository.new }
  before { repo.clear }

  it 'marks side menu item correctly' do
    visit '/contact'
    expect_active_menu_item_to_be('Kontakt')
  end

  it 'displays page correctly' do
    add_contact_text(:pl, text: 'kontakt tekst')
    visit '/contact'
    expect(page.body).to have_content 'kontakt tekst'
  end

  it 'displays page correctly in english' do
    add_contact_text(:en, text: 'contact text')
    visit '/contact'
    switch_langauge_to_english
    expect(page.body).to have_content 'contact text'
  end

  private

  def add_contact_text(language, text:)
    page = Ak::Page.new(
      text: text,
      language: language
    )
    repo.add(:contact, page)
  end
end
