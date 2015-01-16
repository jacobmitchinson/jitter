require 'sinatra'
require_relative './models/jiit'
require_relative 'database_setup'

get '/' do 
  @jiits = Jiit.all
  erb :index
end