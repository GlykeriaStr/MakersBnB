require 'sinatra'

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

run! if app_file == $0

end
