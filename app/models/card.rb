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

  def correct_answer
    increment(:number_correct_answers)
    update_attribute(:number_incorrect_answers, 0)
    update_review_date
  end

  def incorrect_answer
    if number_incorrect_answers > 3
      increment(:number_incorrect_answers)
      save
    else
      decrement(:number_correct_answers) if number_correct_answers > 0
      update_attribute(:number_incorrect_answers, 0)
      update_review_date
    end
  end

  end
  def set_review_date
    self.review_date = Time.now
  end

end
