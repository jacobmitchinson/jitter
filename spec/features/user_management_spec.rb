require 'spec_helper'

feature 'In order to use jitter as a maker' do 

  scenario "I want to sign up to the service" do 
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome to Jitter, Jake!")
    expect(User.first.email).to eq("jake@test.com")
    expect(User.first.name).to eq("Jake")
  end

  scenario "I need to know when I sign up with incorrect details" do 
    expect{ sign_up('aa@.com', 'wrong', 'right', 'jake') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry, your passwords don\'t match.')
  end

  def sign_up(email = "jake@test.com",
              password = "blue",
              password_confirmation = "blue",
              name = "Jake")
    visit "/users/new"
    expect(page.status_code).to eq(200)
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Sign up"
  end



end