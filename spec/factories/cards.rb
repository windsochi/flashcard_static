FactoryGirl.define do
  factory :card do
    original_text "Helicopter"
    translated_text "Вертолет"
    review_date Time.now - 4.days
    user_id "1"
  end
end
