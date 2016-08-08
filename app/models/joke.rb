class Joke < ActiveRecord::Base
  has_many :user_votes
end
