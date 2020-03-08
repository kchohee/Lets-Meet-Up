class UsersController < ApplicationController
  get "/users/:id" do
    if logged_in?
    @user = User.find_by(:id=>session[:user_id])
    erb :"/users/show"
    else
      redirect "/login"
    end
  end

  get "/signup" do
    if logged_in?
      redirect "/users/#{user.id}" 
    else
      erb :"/users/new"
    end
  end

  post "/signup" do
    if !params[:name].empty? && !params[:email].empty? && !params[:password].empty?
      @user = User.create(params)
      @user.save
      session[:user_id] = @user.id
      redirect "/login"
    else
      erb :"/users/error"
    end
  end


  get '/login' do
     @group = Group.all.last
    if logged_in?
      @user = User.find_by(:id=>session[:user_id])
      redirect "/users/#{@user.id}" 
    else
      erb :'/users/login'
    end
  end
  
  post '/login' do
    if !params[:email].empty? && !params[:password].empty?
      @user = User.find_by(:email => params[:email])
      if @user != nil
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
     else
       erb :"/users/error"
     end
    else
      redirect "/login"
    end
  end

  get '/logout' do
    session.destroy
    redirect to "/"
  end

end