require 'spec_helper'

feature 'User browses the list of jiits' do 

  before(:each) { 
    Jiit.create(text: 'Hey there! I\'m on Jitter', time: "3:12")
  }

  scenario 'when on the homepage' do 
    visit '/'
    expect(page).to have_content('Hey there! I\'m on Jitter, 3:12')
  end

end