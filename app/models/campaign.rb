class Campaign < ActiveRecord::Base
  has_many :votes
end
