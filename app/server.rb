require 'sinatra'
require 'rack-flash'
require_relative './helpers/application'
require_relative './models/jiit'
require_relative './models/user'
require_relative 'database_setup'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

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
    flash[:notice] = "Sorry, your passwords don't match."
    erb :'/users/new'
  end
end