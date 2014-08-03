require 'rails_helper'

RSpec.describe "Managing cards" do

  let!(:card) { FactoryGirl.create(:card) }

  before do
    visit new_card_path
    FactoryGirl.create(:card)
  end

  it "should be able to add card" do
    expect(page).to have_title 'Флэшкарточкер | Новая карточка'
    fill_in 'Review date', with: card.review_date
    fill_in 'Original text', with: card.original_text
    fill_in 'Translated text', with: card.translated_text
    click_button('Save Card')
  end

  it "should be able card for root_path" do
    visit cards_path
    expect(page).to have_content 'Helicopter'
  end

  it "should be able check translated" do
    visit root_path
    fill_in 'search', :with => 'Вертолет'
    click_button('Verify')
    expect(page).to have_content 'Correct!'
  end

end
