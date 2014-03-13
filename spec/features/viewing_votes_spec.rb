require 'spec_helper'

describe 'campaign votes' do 

    it 'should display a list of candidates' do 
      Campaign.create(name: "Technical Test", id:1)
      Vote.create(choice: "Lara", validity: "during", campaign_id: 1)
      Vote.create(choice: "Tupele", validity: "during", campaign_id: 1)
      visit '/campaigns/1/votes'
      expect(page).to have_content 'Lara: 1'
      expect(page).to have_content 'Tupele: 1'
    end

    it 'should display total successful votes' do 
      Campaign.create(name: "Technical Test", id:1)
      Vote.create(choice: "Lara", validity: "during", campaign_id: 1)
      Vote.create(choice: "Tupele", validity: "during", campaign_id: 1)
      visit '/campaigns/1/votes'
      expect(page).to have_content 'SUCCESSFUL VOTES = 2'
    end   
    
    it 'should display total failed votes' do 
      Campaign.create(name: "Technical Test", id:1)
      Vote.create(choice: "Lara", validity: "pre", campaign_id: 1)
      Vote.create(choice: "Tupele", validity: "post", campaign_id: 1)
      visit '/campaigns/1/votes'
      expect(page).to have_content 'FAILED VOTES = 2'
    end 
 end