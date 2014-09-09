class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  before_create :set_review_date
  mount_uploader :picture, PictureUploader
  validates :original_text, :translated_text, :user_id, presence: true
  scope :due, -> { where("review_date <= ?", Time.now).order("RANDOM()") }

  def check_translation(translation)
    if translation == translated_text
      correct_answer
      return true
    else
      incorrect_answer
      return false
    end
  end

  def update_review_date
    update_attributes(:review_date, calculation_time_to_update)
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

  def calculation_time_to_update
    case number_correct_answers
    when 0
      Time.now
    when 1
      Time.now + 12.hour
    when 2
      Time.now + 3.day
    when 3
      Time.now + 1.week
    when 4
      Time.now + 2.week
    else
      update_attribute(:number_correct_ansers, 5)
      Time.now + 1.month
    end
  end

  def set_review_date
    self.review_date = Time.now
  end

end
