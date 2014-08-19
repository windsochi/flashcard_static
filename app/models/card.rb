class Card < ActiveRecord::Base
  belongs_to :user
  validates :original_text, :translated_text, :user_id, presence: true
  scope :due, -> (time, id){ where("review_date <= ? AND user_id = ?", time, id).order("RANDOM()") }

  def check_translation(translation)
    translation == translated_text
  end

  def update_review_date
    update_attributes(review_date: Time.now + 3.days)
  end

end
