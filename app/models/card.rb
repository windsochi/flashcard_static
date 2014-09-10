class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  before_create :set_review_date
  mount_uploader :picture, PictureUploader
  validates :original_text, :translated_text, :user_id, presence: true
  scope :due, -> { where("review_date <= ?", Time.now).order("RANDOM()") }

  def check_translation(translation)
    if translation == translated_text
      give_correct_answer
      return true
    else
      give_incorrect_answer
      return false
    end
  end

  def update_review_date
    update_attribute(:review_date, calculate_time_to_update)
  end

  def give_correct_answer
    increment(:correct_answers_counter)
    update_attribute(:incorrect_answers_counter, 0)
    update_review_date
  end

  def give_incorrect_answer
    if incorrect_answers_counter > 3
      increment(:incorrect_answers_counter)
      save
    else
      decrement(:correct_answers_counter) if correct_answers_counter > 0
      update_attribute(:incorrect_answers_counter, 0)
      update_review_date
    end
  end

  def calculate_time_to_update
    case correct_answers_counter
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
      update_attribute(:correct_answers_counter, 5)
      Time.now + 1.month
    end
  end

  def set_review_date
    self.review_date = Time.now
  end

end
