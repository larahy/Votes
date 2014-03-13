class VotesController < ApplicationController

  def index
    @votes = Vote.all
    if params[:campaign_id]
      @campaignvotes = @votes.where(:campaign => params[:campaign_id], :validity => "during")
      @failedvotes = @votes.where(:campaign => params[:campaign_id], :validity => ["pre", "post"])
      candidates = find_candidates(@campaignvotes)
      @candidate_array = []
      candidates.each do |candidate|
        candidate = @campaignvotes.where(choice: candidate)
        @candidate_array << candidate
      end
    end
  end

  def find_candidates(votes)
    candidates = []
    votes.each {|vote| candidates << vote.choice}
    candidates.uniq
  end

end
