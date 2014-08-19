require 'rails_helper'

describe "Login" do

  let!(:user) { create(:user) }

  it "should be able to add card" do
    visit login_path
    fill_in 'email', with: "windsochi@gmail.com"
    fill_in 'password', with: '12345'
    click_button('Login')
    expect(page).to have_content 'Вход выполнен'
  end

end
