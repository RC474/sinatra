
class ApplicationController < Sinatra::Base 
  configure do 
    enable :sessions
    set :session_serect, 'randomserect'
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    redirect to '/index.html'
  end

  get '/login' do 
    erb :'login'
  end

  get '/signup' do 
    erb :'signup'
  end
end