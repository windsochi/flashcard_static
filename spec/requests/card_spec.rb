require 'rails_helper'

RSpec.describe "Managing cards" do

  let!(:card) { FactoryGirl.create(:card) }

  before do
    FactoryGirl.create(:card)
  end

  it "should be able to add card" do
    visit new_card_path
    fill_in 'Review date', with: card.review_date
    fill_in 'Original text', with: card.original_text
    fill_in 'Translated text', with: card.translated_text
    click_button('Save Card')
    expect(Card.last.check_translation("Вертолётик")).to be false
    expect(Card.last.check_translation("Вертолет")) == (Card.last.translated_text)
  end

  it "should show card on root page" do
    visit cards_path
    expect(page).to have_content 'Helicopter'
  end

  it "should show correct message for correct translation" do
    visit root_path
    fill_in 'search', with: 'Вертолет'
    click_button('Verify')
    expect(page).to have_content 'Correct!'
  end

  it "should show correct message for incorrect translation" do
    visit root_path
    fill_in 'search', with: 'Вертолётик'
    click_button('Verify')
    expect(page).to have_content 'Incorrect!'
  end

end
