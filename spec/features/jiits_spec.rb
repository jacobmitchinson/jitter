require 'spec_helper'
require 'helpers/session'

include SessionHelpers


feature 'In order to see what people have to say as a maker' do 

  before(:each) do 
    user = User.create(name: "Jake", 
                       email: "jmitchinson@gmail.com", 
                       password: "jake", 
                       password_confirmation: "jake")
    user.jiits.create(text: 'Hey there! I\'m on Jitter', time: "3:12")
  end

  scenario 'I want to see all peeps in chronological order' do 
    visit '/'
    expect(page).to have_content('Hey there! I\'m on Jitter, 3:12')
  end

end

feature 'In order to let people know what I am doing as a maker' do 

  before(:each) do 
    user = User.create(name: "Jake", 
                       email: "jmitchinson@gmail.com", 
                       password: "jake", 
                       password_confirmation: "jake")
    user.jiits.create(text: 'Hey there! I\'m on Jitter', time: "3:12")
  end


  scenario 'I want to post a jiit' do 
    sign_in('jmitchinson@gmail.com', 'jake')
    fill_in 'jiit', with: 'Hi there Jitter'
    click_button 'submit'
    expect(page).to have_content('Hi there Jitter')
  end

end