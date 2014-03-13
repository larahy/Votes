class Vote < ActiveRecord::Base
  belongs_to :campaign

  def find_candidates(votes)
    candidates = []
    votes.each {|vote| candidates << vote.choice}
    candidates.uniq
  end

end
