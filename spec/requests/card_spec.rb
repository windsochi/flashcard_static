require 'rails_helper'

RSpec.describe "Managing cards" do

  before do
    visit new_card_path
    @card = FactoryGirl.create(:card)
  end

  it "should be able to add card" do
  	expect(page).to have_title 'Флэшкарточкер | Новая карточка'
    fill_in 'Review date', :with => @card.review_date
    fill_in 'Original text', :with => @card.original_text
    fill_in 'Translated text', :with => @card.translated_text
  	click_button('Save Card')
    expect(page).to have_title 'Флэшкарточкер | Все карточки'
  end
end
