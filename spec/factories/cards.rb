FactoryGirl.define do
  factory :card do
    original_text "Apple"
    translated_text "Яблоко"
    review_date Time.now
    user_id "1"
    deck_id "1"
    correct_answers_counter 0
    incorrect_answers_counter 0
  end
end
