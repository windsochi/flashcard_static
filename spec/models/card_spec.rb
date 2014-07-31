require 'rails_helper'

RSpec.describe Card do

  before do
    @card = Card.create!(original_text: "House", translated_text: "Дом", review_date: Time.now - 3.days)
  end

  it "check translated for false" do
    expect(@card.check_translation("Домик")).to be false
  end

  it "check translated for true" do
    expect(@card.check_translation("Дом")) == (@card.translated_text)
  end

  it "Updates reviews date" do
    expect(@card.create_card) == (Time.now + 3.days)
  end

end
