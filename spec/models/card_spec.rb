require 'rails_helper'

describe Card do
  it { should belong_to(:user) }
  it { should belong_to(:deck) }
  it { should validate_presence_of :original_text }
  it { should validate_presence_of :translated_text }
  it { should validate_presence_of :user_id }

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
    let!(:card) { FactoryGirl.create :card }

    before do
      card.give_correct_answer
    end

    describe 'when field correct_answers_counter eq 1' do
      it { expect(card.correct_answers_counter) == 1 }
      it { expect(card.incorrect_answers_counter) == 0 }
      it { expect(card.review_date) == Time.now + 12.hour }
    end

    describe 'when field correct_answers_counter eq 2' do
      it { expect(card.correct_answers_counter) == 2 }
      it { expect(card.incorrect_answers_counter) == 0 }
      it { expect(card.review_date) == Time.now + 3.day }
    end

    describe 'when field correct_answers_counter eq 3' do
      it { expect(card.correct_answers_counter) == 3 }
      it { expect(card.incorrect_answers_counter) == 0 }
      it { expect(card.review_date) == Time.now + 1.week }
    end

    describe 'when field correct_answers_counter eq 4' do
      it { expect(card.correct_answers_counter) == 4 }
      it { expect(card.incorrect_answers_counter) == 0 }
      it { expect(card.review_date) == Time.now + 2.week }
    end

    describe 'when field correct_answers_counter eq 5' do
      it { expect(card.correct_answers_counter) == 5 }
      it { expect(card.incorrect_answers_counter) == 0 }
      it { expect(card.review_date) == Time.now + 1.month }
    end

  end

end
