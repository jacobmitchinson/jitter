require 'sinatra'
require_relative './helpers/application'
require_relative './models/jiit'
require_relative './models/user'
require_relative 'database_setup'

enable :sessions
set :session_secret, 'super secret'


get '/' do 
  @jiits = Jiit.all
  erb :index
end

get '/users/new' do 
  erb :'/users/new'
end

post '/users' do 
  user = User.create(name: params[:name],
                  email: params[:email],
                  password: params[:password])
  session[:user_id] = user.id
  redirect '/'
end