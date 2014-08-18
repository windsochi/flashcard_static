require 'rails_helper'

describe "Managing cards" do

  let!(:card) { FactoryGirl.create(:card) }
  let!(:user) { FactoryGirl.create(:user) }

  it "should be able to add card" do
    visit login_path
    fill_in 'email', with: "windsochi@gmail.com"
    fill_in 'password', with: '12345'
    click_button('Login')

    visit new_card_path
    fill_in 'Review date', with: card.review_date
    fill_in 'Original text', with: card.original_text
    fill_in 'Translated text', with: card.translated_text
    find(:xpath, "//input[@id='card_user_id']").set "1"
    click_button('Создать')
    expect(page).to have_content 'Карточка успешно создана'
  end

end
