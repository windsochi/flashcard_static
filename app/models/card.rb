class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  scope :due, -> { where("review_date <= ?", Time.now).order("RANDOM()") }

  def check_translation(translation)
    translation == translated_text
  end

  def create_card
    update_attributes(review_date: Time.now + 3.days)
  end
end
