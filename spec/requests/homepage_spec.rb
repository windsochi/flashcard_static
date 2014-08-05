require 'rails_helper'

describe "Homepage" do

  before :each do
    FactoryGirl.create(:card, original_text: "Helicopter", translated_text: "Вертолет")
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
