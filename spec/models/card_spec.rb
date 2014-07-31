require 'rails_helper'

RSpec.describe Card, :type => :model do
  
  before do
    @card = Card.create!(original_text: "House", translated_text: "Дом", review_date: Time.now - 3.days)
  end

  it "check translated false" do
  	expect(@card.check_translation("Домик")).to be false
  end

  it "check translated true" do
    expect(@card.check_translation("Дом")) == (@card.translated_text)
  end

  it "Update review_date = + 3.days" do
    expect(@card.create_card) == (Time.now + 3.days)
  end
  
end
