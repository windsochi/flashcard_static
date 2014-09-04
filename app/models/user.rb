class User < ActiveRecord::Base
  has_many :cards
  has_many :decks
  belongs_to :current_deck, foreign_key: "current_deck_id"
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  validates :password, confirmation: true, length: { minimum: 3 }, :if => :password_set?
  validates :password_confirmation, presence: true, :if => :password_set?
  validates :email, uniqueness: true

  def password_set?
    @password
  end

end
