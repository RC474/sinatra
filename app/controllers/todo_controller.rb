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
  


  # edit
  post "/todos/edit" do
    if session[:user_id]
      old_todo = Todo.find_by(id: params[:todoid])
      old_todo.todo = params[:todo]
      old_todo.save
      redirect '/todos'
    else
      redirect '/login'
    end
  end

  #delete
  get "/todos/delete/:todoid" do
    if session[:user_id]

      old_todo = Todo.find_by_id(params['todoid'].to_i)
      old_todo.delete
      redirect '/todos'
    else
      redirect '/login'
    end
  end


end