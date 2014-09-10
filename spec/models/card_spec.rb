require 'rails_helper'

describe Card do

  let(:user) {FactoryGirl.create(:user, email: "windsochi@gmail.com",
                                        password: "12345",
                                        password_confirmation: "12345")}
  let(:card) {FactoryGirl.create(:card, original_text: "House",
                                        translated_text: "Дом",
                                        user_id: user.id,
                                        review_date: Time.now,
                                        number_correct_answers: 0,
                                        number_incorrect_answers: 0)}

  describe "check translation" do
    it "doesn't permit invalid translation" do
      expect(card.check_translation("Домик")).to be false
    end

    it "permits valid translation" do
      expect(card.check_translation("Дом")) == (card.translated_text)
    end
  end

  describe "update review date" do

    before(:each) do
      time = Time.parse("09-09-2014")
      allow(Time).to receive(:now) { time }
      card.give_correct_answer
    end

    describe "in order to number correct answer eq 0" do

      describe "correct answer 1"
        it {expect(card.review_date).to eq (Time.now + 12.hour)}
        it {expect(card.number_correct_answers).to eq 1}
        it {expect(card.number_incorrect_answers).to eq 0}
      end

    end

  end

end
