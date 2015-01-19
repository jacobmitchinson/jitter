require 'sinatra'
require 'rack-flash'
require_relative './helpers/application'
require_relative './models/jiit'
require_relative './models/user'
require_relative 'database_setup'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride 

get '/' do 
  @jiits = Jiit.all
  erb :index
end

get '/users/new' do 
  @user = User.new
  erb :'/users/new'
end

post '/users' do 
  @user = User.new(name: params[:name],
                  email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    flash[:errors] = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/sessions/new' do 
  erb :'sessions/new'
end

post '/sessions' do
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ["The email or password is incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do 
  flash[:notice] = "Goodbye!"
  session[:user_id] = nil
  redirect '/'
end