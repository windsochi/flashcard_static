require 'rails_helper'

describe Card do

  before do
    @user = User.create!(email: "windsochi@gmail.com", password: "12345", password_confirmation: "12345")
    @card = Card.create!(original_text: "House", translated_text: "Дом", review_date: Time.now - 3.days, user_id: @user.id)
  end

  it "doesn't permit invalid translation" do
    expect(@card.check_translation("Домик")).to be false
  end

  it "permits valid translation" do
    expect(@card.check_translation("Дом")) == (@card.translated_text)
  end

  it "Updates reviews date" do
    expect(@card.update_review_date) == (Time.now + 3.days)
  end

end
