class GroupsController < ApplicationController

  get "/groups" do
      @groups = Group.all
    erb :"groups/index"
  end

  get "/groups/new" do
    if logged_in?
      @user = User.find_by(:id=>session[:user_id])
      erb :"/groups/new"
    else
      redirect "/login"
    end
  end

  post "/groups" do
    if !params[:name].empty? && !params[:bio.empty?]
      @group = Group.create(params)
      @user = User.find_by(:id=>session[:user_id])
      @user.group = @group
      @user.save
      redirect "/groups/#{@group.id}"
    else
      @user = User.find_by(:id=>session[:user_id])
      erb :"/groups/error"
    end
  end

  get "/groups/:id" do
    if logged_in?
      @user = User.find_by(:id=>session[:user_id])
      erb :"/groups/show"
    else
      redirect"/login"
    end
  end

  get "/groups/:id/edit" do
    if logged_in?
      @group = Group.find_by(params[:id])
      erb :"/groups/edit"
    else
      redirect "/login"
    end
  end

  patch "/groups/:id/edit" do
    if logged_in?
      @group = Group.find_by(params[:id])
      @group.name = params[:name]
      @group.bio = params[:bio]
      @group.save
      redirect "/groups/#{@group.id}"
    else
      redirect "/login"
    end
  end
  
  get "/groups/:id/join" do
    if logged_in?
      @user = User.find_by(:id=>session[:user_id])
      @group = Group.find_by(params[:id])
        erb :"/groups/join"
    else
      redirect "/login"
    end
  end

  patch "/groups/:id/join" do
     if logged_in? 
      @user = User.find_by(:id=>session[:user_id])
      @group = Group.find_by(params[:id])
      @user.group = @group
      @user.save
      redirect "/groups/#{@user.group.id}"
     else
      redirect "/login"
     end
    end

end