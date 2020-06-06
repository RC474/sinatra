
class ApplicationController < Sinatra::Base 
  configure do 
    set :views, 'app/views'
  end

  get '/' do 
    @new_hash = {
      :name => "Ramesh",
    }
    erb :'homepage'
  end

  get '/login' do 
    erb :'login'
  end

  get '/signup' do 
    erb :'signup'
  end
end