class GroupsController < ApplicationController

  get "/groups" do
    if logged_in?
      @groups = Group.all_except_current_user
    else
      @groups = Group.all
    end
    
    erb :"groups/index"
  end

  get "/groups/new" do
    if logged_in?
      erb :"/user_groups/new"
    else
      redirect "/login"
    end
  end

  post "/groups" do
    if !params[:name].empty? && !params[:bio.empty?]
    @group = Group.create(params)
    @group.save
    redirect "/groups/#{group.id}"
    else
      redirect :"/groups/error"
    end
  end
end