require 'sinatra'

class MakersBnB < Sinatra::Base
  
  get '/' do
    erb(:index)
  end

  get '/login' do
    erb(:login)
  end

  get '/spaces' do
    erb(:spaces)
  end

run! if app_file == $0

end
