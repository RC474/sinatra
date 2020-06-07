class SessionController < ApplicationController

  get '/signup' do
    erb :'signup'
  end

  get '/login' do
    erb :'login'
  end

  post '/signup' do
    # this is the way you should do it if you're using nested params User.create(params[:user])
    user = User.new
    user.firstname = params[:firstname]
    user.lastname = params[:lastname]
    user.username = params[:username]
    user.password = params[:password]
    user.save
    session[:user_id] = user.id
    redirect to '/'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    puts "------------------------------------------------------------------"
    puts user
    if user && user.password == (params[:password])
      session[:user_id] = user.id
      redirect '/todos'
    else
      @error = "Invalid Credentials"
      erb :'login'
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect to "/"
  end

end