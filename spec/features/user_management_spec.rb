require 'spec_helper'

feature 'User signs up' do 

  scenario "when being a new user visiting the site" do 
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome to Jiiter, Jake!")
    expect(User.first.email).to eq("jake@test.com")
  end

  def sign_up(email = "jake@test.com",
              password = "blue")
    visit "/users/new"
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Sign up"
  end

end