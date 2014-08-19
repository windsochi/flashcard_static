FactoryGirl.define do
  factory :card do
    original_text "Helicopter"
    translated_text "Вертолет"
    review_date Time.now - 4.days
    user_id ''
  end

  factory :card1 do
    original_text "Helicopter"
    translated_text "Вертолет"
    review_date Time.now - 3.days
    user_id ''
  end
end
