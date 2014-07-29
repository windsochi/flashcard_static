class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  scope :due, -> { where("review_date <= ?", Time.now) }

  def check_translation(translation)
    translation == translated_text
  end
end
