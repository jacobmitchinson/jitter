require 'spec_helper'

feature 'User browses the list of jiits' do 

  before(:each) { 
    Jiit.create(text: 'Hey there! I\'m on Jitter')
  }

  scenario 'when on the homepage' do 
    visit '/'
    expect(page).to have_content('Hey there! I\'m on Jitter')
  end

end