require 'spec_helper'

describe Card do
  before do
    @card = Card.new(original_text: "House", translated_text: "Дом", review_date: Time.now - 4.days)
  end

  it "check translated_text & original_text" do
	expect(@card.check_translation("Домик")).should be_false
  end

  it "Update review_date = + 3.days" do
    @card.create_card.should be_true
  end
end