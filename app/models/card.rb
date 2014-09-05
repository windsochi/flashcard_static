class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  before_create :set_review_date
  mount_uploader :picture, PictureUploader
  validates :original_text, :translated_text, :user_id, presence: true
  scope :due, -> { where("review_date <= ?", Time.now).order("RANDOM()") }

  def check_translation(translation)
    translation == translated_text
  end

  def update_review_date
    update_attributes(review_date: Time.now + 3.days)
  end

  def set_review_date
    self.review_date = Time.now - 1.days
  end

end
