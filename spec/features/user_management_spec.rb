require 'spec_helper'
require 'helpers/session'

include SessionHelpers

feature 'In order to use jitter as a maker' do 

  scenario "I want to sign up to the service" do 
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome to Jitter, Jake!")
    expect(User.first.email).to eq("jake@test.com")
    expect(User.first.name).to eq("Jake")
  end

  scenario "I need to know when I sign up with an incorrect password" do 
    expect{ sign_up('aa@.com', 'wrong', 'right', 'jake') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry, your passwords don\'t match.')
  end

  scenario "I need to know when I sign up with an email that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end

end

feature 'In order to use Jitter as a Maker I want to login' do


  before(:each) do 
    User.create(name: "Jake",
                email: "jake@test.com",
                password: "jake",
                password_confirmation: "jake")
  end

  scenario 'with correct credentials' do 
    visit '/'
    expect(page).not_to have_content('Welcome to Jitter, Jake!')
    sign_in('jake@test.com', 'jake')
    expect(page).to have_content("Welcome to Jitter, Jake!")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, test@test.com")
    sign_in('test@test.com', 'wrong')
    expect(page).not_to have_content("Welcome to Jitter,")
  end

end

feature 'User signs out' do

  before(:each) do
    User.create(:name => "test",
                :email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'test')
    click_button "Sign out"
    expect(page).to have_content("Goodbye!")
    expect(page).not_to have_content("Welcome to Jitter, test.")
  end

end