class User < ActiveRecord::Base
  has_many :cards
  authenticates_with_sorcery!
end
