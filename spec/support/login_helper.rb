module LoginHelper
  def sign_in(user)
    fill_in 'email', with: "windsochi@gmail.com"
    fill_in 'password', with: '12345'
    click_button('Login')
  end
end
