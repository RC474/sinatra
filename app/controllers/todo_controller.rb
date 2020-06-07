class TodosController < ApplicationController

   #index
  get "/todos" do
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
      erb :"todos"
    else
      redirect '/login'
    end
  end

  # #new
  # get "/posts/new" do
  #   erb :"/posts/new.html"
  # end

  # # create
  # post "/posts" do
  #   redirect "/posts"
  # end

  # # show
  # get "/posts/:id" do
  #   erb :"/posts/show.html"
  # end

end