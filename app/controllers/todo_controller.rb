class TodosController < ApplicationController

   #index
  get "/todos" do
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
      @todo_list = Todo.where('user_id = ?', session[:user_id])
      erb :"todos"
    else
      redirect '/login'
    end
  end

  #new
  post "/todos/new" do
    if session[:user_id]
      newtodo = Todo.new
      newtodo.todo = params[:todo]
      newtodo.iscompelete = false 
      newtodo.user_id = session[:user_id]
      newtodo.save 
      redirect '/todos'
    else
      redirect '/login'
    end
  end
  

  # # create
  # post "/posts" do
  #   redirect "/posts"
  # end

  # # show
  # get "/posts/:id" do
  #   erb :"/posts/show.html"
  # end

end