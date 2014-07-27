class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  scope :first_card, -> { where("review_date <= ?", Time.now).first }
end
