require 'spec_helper'

describe Card do
  it "Card has be translated" do
	card = Card.new(:original_text => "House",
					:translated_text => "Дом",
					:review_date => Time.now)
	expect(card.check_translation("Домик")).should be_false
  end

  it "review_date has be update + 3.days" do
    card = Card.new(:original_text,
    				:translated_text,
    				:review_date => Time.now - 4.days)
    card.create_card.should be_true
  end
end