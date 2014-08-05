require 'rails_helper'

RSpec.describe "Managing cards" do

  let!(:card) { FactoryGirl.create(:card) }

  it "should be able to add card" do
    visit new_card_path
    fill_in 'Review date', with: card.review_date
    fill_in 'Original text', with: card.original_text
    fill_in 'Translated text', with: card.translated_text
    click_button('Save Card')
    expect(page).to have_content 'Helicopter'
  end

end
