require 'sinatra'
require_relative './models/jiit'
require_relative './models/user'
require_relative 'database_setup'

get '/' do 
  @jiits = Jiit.all
  erb :index
end

get '/users/new' do 
  erb :'/users/new'
end