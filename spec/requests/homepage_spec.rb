require 'rails_helper'

describe "Homepage" do

  let!(:card) { FactoryGirl.create(:card) }
  let!(:user) { FactoryGirl.create(:user) }

  before :each do
    visit login_path
    fill_in 'email', with: "windsochi@gmail.com"
    fill_in 'password', with: '12345'
    click_button('Login')
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
