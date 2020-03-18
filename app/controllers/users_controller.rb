class UsersController < ApplicationController
  get "/users/:id" do
    if logged_in?
    erb :"/users/show"
    else
      redirect "/login"
    end
  end

  get "/signup" do
    if logged_in?
      redirect "/users/#{current_user.id}" 
    else
      erb :"/users/new"
    end
  end

  post "/signup" do
    if valid_login?
      user = User.new(params)
      if user.valid? 
        user.save
        session[:user_id] = user.id
        redirect "/users/#{user.id}"
      end
    end
    erb :"/users/error"
  end


  get '/login' do
    if logged_in?
      redirect "/users/#{current_user.id}" 
    else
      erb :'/users/login'
    end
  end
  
  post '/login' do
      if valid_login?
        if valid_user?
        redirect "/users/#{current_user.id}"
      else
       erb :"/users/error"
      end
    else
      "/login"
    end
  end

  get '/logout' do
    session.destroy
    redirect to "/"
  end

end