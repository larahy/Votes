require 'spec_helper'

describe 'viewing campaigns' do 
 # let(:campaign) {Campaign.create(name: "Job")}
  context 'all campaigns' do 

    it 'should display a list of campaigns on the index page' do 
      Campaign.create(name: "Technical Test", id:1)
      visit '/campaigns'
      expect(page).to have_content 'Technical Test'
    end

    it 'should act as a link to individual campaign pages' do 
      Campaign.create(name: "Job", id:2)
      visit '/campaigns'
      click_link 'Job'
      expect(current_path).to eq '/campaigns/2/votes'
      expect(page).to have_content 'FAILED VOTES'
    end
      
    
  end

end