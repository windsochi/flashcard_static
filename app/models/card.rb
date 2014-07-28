class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  scope :due, -> { where("review_date <= ?", Time.now) }

  def :check_card
    if @search == @random_card.translated_text
      @random_card.update_attributes
      redirect_to root_path
      flash[:notice] = "Correct"
    else
      redirect_to root_path
      flash[:notice] = "Incorrect"
    end
  end

  def update_attributes(review_date)
    review_date + 2.days
    save
  end
end
