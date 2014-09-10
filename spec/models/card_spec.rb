require 'rails_helper'

describe Card do

  describe ".check_translation" do
    let!(:user) { FactoryGirl.create :user }
    let!(:card) { FactoryGirl.create :card }

    context 'when translation invalid' do
      it { expect(card.check_translation("Яблочко")).to be false }
    end

    context 'when translation valid' do
      it { expect(card.check_translation("Яблоко")) == card.translated_text }
    end
  end

  describe ".give_correct_answer" do
    let!(:user) { FactoryGirl.create :user }

    describe 'when field correct_answers_counter eq 1' do
      let(:card) { FactoryGirl.create :card, correct_answers_counter: 0, review_date: "04:33:48.245349000" }
      before { card.give_correct_answer }
      it { expect(card.correct_answers_counter).to eq 1 }
      it { expect(card.incorrect_answers_counter).to eq 0 }
      it { expect(card.review_date).to eq "04:33:48.245349000" + 12.hour }
    end

  end

end
