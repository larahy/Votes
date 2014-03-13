require 'spec_helper'

describe 'viewing campaigns' do 
 # let(:campaign) {Campaign.create(name: "Job")}
  context 'all campaigns' do 

    it 'should display a list of campaigns on the index page' do 
      Campaign.create(name: "Job")
      visit '/campaigns'
      expect(page).to have_content 'CAMPAIGN:Job'
    end

    it 'should act as a link to individual campaign pages' do 
      
    
  end

end