require 'rails_helper'

RSpec.describe "Managing cards" do

  before do
    visit new_card_path
  end

  it "should be able to add card" do
  	expect(page).to have_title 'Флэшкарточкер | Новая карточка'
  	fill_in 'Review date', :with => Time.now - 4.days
  	fill_in 'Original text', :with => "Qwerty"
  	fill_in 'Translated text', :with => "Йцукен"
  	click_button('Save Card')
    expect(page).to have_title 'Флэшкарточкер | Все карточки'
  end
end
