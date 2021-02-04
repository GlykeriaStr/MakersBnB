require "sinatra/base"
require "sinatra/flash"
require "./lib/spaces"
require "./lib/user"
require "./lib/booking"

class MakersBnB < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/login' do
    erb(:login)
  end

  get '/spaces' do
    @spaces = Spaces.all
    p @spaces
    erb(:"spaces/index")
  end

  get '/spaces/new' do
    erb(:"spaces/new")
  end

  get '/spaces/:id' do
    @space = Spaces.find_by_id(id: params[:id])
    @add_booking = Booking.create(listing_id: params[:id], user_id: session[:user_id])
    erb(:"spaces/book")
  end

  post '/spaces' do
    user = User.find_by_id(id: session[:user_id])
    space = Spaces.create(name: params[:spacename], description: params[:spacedescription], cost: params[:spaceprice], user_id: user.id)
    p space
    session[:id] = space.id
    redirect '/spaces'
  end

  post "/users" do
    user = User.create(email: params[:email], password: params[:password], name: params[:name])
    session[:user_id] = user.id
    redirect "/spaces"
  end

  post "/sessions" do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/spaces')
    else
      flash[:notice] = "Please check your email or password."
      redirect "login"
    end
  end

  post '/sessions/destroy' do 
    session.clear 
    flash[:notice] = "You have logged out!"
    redirect '/'
  end 
  

run! if app_file == $0

end
