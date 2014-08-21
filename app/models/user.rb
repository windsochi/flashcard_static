class User < ActiveRecord::Base
  has_many :cards
  authenticates_with_sorcery!

  validates :password, confirmation: true, length: { minimum: 3 }, :if => :password_set?
  validates :password_confirmation, presence: true, :if => :password_set?
  validates :email, uniqueness: true

  def password_set?
    @password
  end

end
