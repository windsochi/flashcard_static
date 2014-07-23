class Card < ActiveRecord::Base
  validates :original_text, presence: true
end
