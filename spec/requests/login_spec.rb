require 'rails_helper'

describe "Login" do

  let!(:user) { create(:user) }

  it "should be able to enter user" do
    visit login_path
    sign_in(user)
    expect(page).to have_content 'Вход выполнен'
  end

end
