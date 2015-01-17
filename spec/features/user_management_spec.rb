require 'spec_helper'

feature 'User signs up' do 

  scenario "when being a new user visiting the site" do 
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome to Jitter, Jake!")
    expect(User.first.email).to eq("jake@test.com")
    expect(User.first.name).to eq("Jake")
  end

  def sign_up(email = "jake@test.com",
              password = "blue",
              name = "Jake")
    visit "/users/new"
    expect(page.status_code).to eq(200)
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Sign up"
  end

end