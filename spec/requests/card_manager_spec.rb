require 'rails_helper'

describe "Managing cards" do

  let!(:card) { FactoryGirl.create(:card) }
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    login_user_post("windsochi@gmail.com", "12345")
  end

  it "should be able to add card" do
    visit new_card_path
    fill_in 'Review date', with: card.review_date
    fill_in 'Original text', with: card.original_text
    fill_in 'Translated text', with: card.translated_text
    find(:xpath, "//input[@id='card_user_id']").set "1"
    click_button('Создать')
    expect(page).to have_content 'Карточка успешно создана'
  end

end
