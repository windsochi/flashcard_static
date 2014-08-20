require 'rails_helper'

describe "Homepage" do

  let!(:user) { create(:user) }
  let!(:card) { create(:card, user_id: user.id) }

  before :each do
    visit login_path
    sign_in(user)
    visit root_path
  end

  it "should show correct message for correct translation" do
    fill_in 'search', with: 'Вертолет'
    click_button('Verify')
    expect(page).to have_content 'Correct!'
  end

  it "should show correct message for incorrect translation" do
    fill_in 'search', with: 'Вертолетик'
    click_button('Verify')
    expect(page).to have_content 'Incorrect!'
  end

end
