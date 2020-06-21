class SessionController < ApplicationController

  get '/signup' do
    erb :'signup'
  end

  get '/login' do
    erb :'login'
  end

  post '/signup' do
    # this is the way you should do it if you're using nested params User.create(params[:user])
    existed_user = User.find_by(username: params[:username])
    if existed_user
      @error_msg = "This user name is already taken"
      erb :'signup'
    else

      user = User.new
      # (:firstname => params[:firstname], :lastname => params[:lastname], :username => params[:username], :password => params[:password])
      user.firstname = params[:firstname]
      user.lastname = params[:lastname]
      user.username = params[:username]
      user.password = params[:password]
      if user.valid?
        puts "valid"
      else
        puts "invalid"
      end
      # user.save
      unless user.save 
        user.errors.messages.each do |field, messages|
          puts "#{field}: #{messages}"
        end
      end
      session[:user_id] = user.id
      redirect to '/todos'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
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