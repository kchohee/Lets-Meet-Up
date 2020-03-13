class GroupsController < ApplicationController

  get "/groups" do
    erb :"groups/index"
  end

  get "/groups/new" do
    if logged_in?
      erb :"/groups/new"
    else
      redirect "/login"
    end
  end

  post "/groups" do
    if valid_create_group?
      group = create_group
      redirect "/groups/#{group.id}"
    else
      erb :"/groups/error"
    end
  end

  get "/groups/:group_id" do
    if logged_in?
      erb :"/groups/show"
    else
      redirect"/login"
    end
  end

  get "/groups/:group_id/edit" do
    if logged_in?
      erb :"/groups/edit"
    else
      redirect "/login"
    end
  end

  patch "/groups/:group_id/edit" do
    if logged_in?
      update_group
      redirect "/groups/#{current_group.id}"
    else
      redirect "/login"
    end
  end
  
  get "/groups/:group_id/join" do
    if logged_in?
      @group = current_group
      @user = current_user
        erb :"/groups/join"
    else
      redirect "/login"
    end
  end

  patch "/groups/:group_id/join" do
     if logged_in? 
      user = join_group
      redirect "/groups/#{current_user.group.id}"
     else
      redirect "/login"
     end
    end

    patch "/groups/:group_id/leave" do
      if logged_in?
        if users_group?
          leave_group
          Post.where(:user_id => current_user.id ).destroy_all
          redirect "/users/#{current_user.id}"
        else 
          redirect "/groups"
        end
      else 
        redirect "/login"
    end
  end

end