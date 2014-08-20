require 'rails_helper'

describe "Managing cards" do

  let!(:user) { create(:user, email: "windsochi@gmail.com", password: "12345") }
  let!(:card) { create(:card, user_id: user.id) }

  it "should be able to add card" do
    visit login_path
    fill_in 'email', with: "windsochi@gmail.com"
    fill_in 'password', with: "12345"
    click_button('Login')

    visit new_card_path
    fill_in 'Review date', with: card.review_date
    fill_in 'Original text', with: card.original_text
    fill_in 'Translated text', with: card.translated_text
    click_button('Save Card')
    expect(page).to have_content 'Карточка успешно создана'
  end

end
