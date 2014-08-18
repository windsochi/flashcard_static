require 'rails_helper'

describe "Homepage" do

  let!(:card) { FactoryGirl.create(:card) }
  let!(:user) { FactoryGirl.create(:user) }

  before :each do
    login_user_post("windsochi@gmail.com", "12345")
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
