require 'sinatra'
require './lib/spaces'

class MakersBnB < Sinatra::Base
  
  get '/' do
    erb(:index)
  end

  get '/login' do
    erb(:login)
  end

  get '/spaces' do
    erb(:"spaces/index")
  end
  
  get '/spaces/new' do
    erb(:"spaces/new")
  end

  # get '/booking/:id' do
  get '/spaces/1' do
    erb(:"spaces/book")
  end

  post '/spaces' do
    redirect '/spaces'
  end

  post '/create-spaces' do
    Spaces.create(name: params["space-name"])
    redirect '/spaces'
  end


run! if app_file == $0

end
