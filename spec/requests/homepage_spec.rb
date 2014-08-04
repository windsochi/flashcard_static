require 'rails_helper'

RSpec.describe "Managing cards" do

  let!(:card) { FactoryGirl.create(:card) }

  before do
    FactoryGirl.create(:card)
  end

  it "should show correct message for correct translation" do
    visit root_path
    fill_in 'search', with: 'Вертолет'
    click_button('Verify')
    expect(page).to have_content 'Correct!'
  end

  it "should show correct message for incorrect translation" do
    visit root_path
    fill_in 'search', with: 'Вертолётик'
    click_button('Verify')
    expect(page).to have_content 'Incorrect!'
  end

end
