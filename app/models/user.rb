class User < ActiveRecord::Base
  has_many :cards
  has_many :decks
  has_many :authentications, :dependent => :destroy
  belongs_to :current_deck, foreign_key: "current_deck_id"

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  accepts_nested_attributes_for :authentications

  validates :password, confirmation: true, length: { minimum: 3 }, :if => :password_set?
  validates :password_confirmation, presence: true, :if => :password_set?
  validates :email, uniqueness: true

  def password_set?
    @password
  end

  def due_cards
    if current_deck_id
      current_deck.cards.due
    else
      cards.due
    end
  end

end
