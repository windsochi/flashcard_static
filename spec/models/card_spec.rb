require 'rails_helper'

describe Card do

  describe "#check_translation" do
    let!(:user) { FactoryGirl.create :user }
    let!(:card) { FactoryGirl.create :card }

    context 'when translation invalid' do
      it { expect(card.check_translation("Яблочко")).to be false }
    end

    context 'when translation valid' do
      it { expect(card.check_translation("Яблоко")) == card.translated_text }
    end
  end

  describe "#processing_correct_answer" do
    let!(:user) { FactoryGirl.create :user }

    before(:each) do
      t = Time.parse("10-09-2014")
      allow(Time).to receive(:now) { t }
      card.processing_correct_answer
    end

    context 'when field correct_answers_counter eq 1' do
      let(:card) { FactoryGirl.create :card, correct_answers_counter: 0, review_date: Time.now }
      it { expect(card.correct_answers_counter).to eq 1 }
      it { expect(card.incorrect_answers_counter).to eq 0 }
      it { expect(card.review_date).to eq Time.now + 12.hour }
    end

    context 'when field correct_answers_counter eq 2' do
      let(:card) { FactoryGirl.create :card, correct_answers_counter: 1, review_date: Time.now }
      it { expect(card.correct_answers_counter).to eq 2 }
      it { expect(card.incorrect_answers_counter).to eq 0 }
      it { expect(card.review_date).to eq Time.now + 3.day }
    end

    context 'when field correct_answers_counter eq 3' do
      let(:card) { FactoryGirl.create :card, correct_answers_counter: 2, review_date: Time.now }
      it { expect(card.correct_answers_counter).to eq 3 }
      it { expect(card.incorrect_answers_counter).to eq 0 }
      it { expect(card.review_date).to eq Time.now + 1.week }
    end

    context 'when field correct_answers_counter eq 4' do
      let(:card) { FactoryGirl.create :card, correct_answers_counter: 3, review_date: Time.now }
      it { expect(card.correct_answers_counter).to eq 4 }
      it { expect(card.incorrect_answers_counter).to eq 0 }
      it { expect(card.review_date).to eq Time.now + 2.week }
    end

    context 'when field correct_answers_counter eq 5' do
      let(:card) { FactoryGirl.create :card, correct_answers_counter: 4, review_date: Time.now }
      it { expect(card.correct_answers_counter).to eq 5 }
      it { expect(card.incorrect_answers_counter).to eq 0 }
      it { expect(card.review_date).to eq Time.now + 1.month }
    end

  end

  describe "#processing_incorrect_answer" do
    let!(:user) { FactoryGirl.create :user }

    before(:each) do
      t = Time.parse("10-09-2014")
      allow(Time).to receive(:now) { t }
      card.processing_incorrect_answer
    end

    context 'when field incorrect_answers_counter > 3' do
      let(:card) { FactoryGirl.create :card, incorrect_answers_counter: 3, review_date: Time.now }
      it { expect(card.correct_answers_counter).to eq 0 }
      it { expect(card.incorrect_answers_counter).to eq 0 }
      it { expect(card.review_date).to eq Time.now }
    end

    context 'when field incorrect_answers_counter eq 1' do
      let(:card) { FactoryGirl.create :card, incorrect_answers_counter: 1, correct_answers_counter: 1, review_date: Time.now }
      it { expect(card.correct_answers_counter).to eq 0 }
      it { expect(card.incorrect_answers_counter).to eq 0 }
      it { expect(card.review_date).to eq Time.now }
    end

  end

end
