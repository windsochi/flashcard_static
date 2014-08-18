require 'rails_helper'

describe "Login user" do

  let!(:user) { FactoryGirl.create(:user) }

  it "should be able login for user" do
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'password', with: '12345'
    click_button('Login')
    expect(page).to have_content 'Вход выполнен'
  end

end
