require 'spec_helper'

describe 'Reviews page', type: :feature do
  let(:repo) { Ak::ReviewsRepository.new }
  before { repo.clear }

  it 'marks side menu item correctly' do
    visit '/reviews'
    expect_active_menu_item_to_be('Recenzje')
  end

  it 'displays page correctly' do
    add_review(:pl, text: 'review text', author: 'mr. R')
    visit '/reviews'
    expect(page.body).to have_content /review text/i
    expect(page.body).to have_content /mr. R/i
  end

  it 'displays page correctly in english' do
    add_review(:en, text: 'review text', author: 'mr. R')

    visit '/reviews'
    switch_langauge_to_english
    expect(page.body).to have_content /review text/i
    expect(page.body).to have_content /mr. R/i
  end

  private

  def add_review(language, text:, author:)
    review = Ak::Review.new(
      text: text,
      author: author,
      language: language
    )
    repo.add(review)
  end
end
