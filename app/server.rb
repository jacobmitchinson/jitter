require 'sinatra'

get '/' do 
  @jiits = Jiit.all
  erb :index
end