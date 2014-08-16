class User < ActiveRecord::Base
  has_many :cards
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :email, uniqueness: true

end
