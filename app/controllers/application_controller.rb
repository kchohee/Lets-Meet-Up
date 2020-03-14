require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    all_groups
    erb :welcome
  end
  
  helpers do
    # USER HELPERS
    def logged_in?
      !!current_user
    end
    def current_user
      if @my_user
        return @my_user
      elsif session[:user_id]
        @my_user = User.find(session[:user_id])
      end
      return @my_user
    end
  end
  # post helpers
  def all_post
    posts = Post.all
    return posts
  end
  def last_post
    post = Post.all.last
    return post
  end
  def current_post
    post = Post.find_by(:id => params[:post_id])
    return post
  end
  def users_post
    post = Post.all.where :user_id=> current_user.id
    return post
  end
  # GROUPS HELPERS
    def all_groups
      group = Group.all
      return group
    end
    def last_group
      group = Group.all.last
      return group
    end
    def current_group
      group = Group.find_by id: params[:group_id]
      return group
    end
    # Valid helpers
    def valid_create_group?
      !params[:name].empty? && !params[:bio.empty?]
    end
    def valid_signup?
      !params[:name].empty? && !params[:email].empty? && !params[:password].empty?
    end
    def valid_login?
      !params[:email].empty? && !params[:password].empty?
    end
    def valid_post?
      !params[:content].empty?
    end
    # Create helpers
    def user_created
      user = User.create(params)
      if user.valid? 
        user.save
        @my_user = user
      end
      return user
    end
    def create_group
      group = Group.create(params)
      if group.valid?
        user = User.find_by(:id=>session[:user_id])
        user.group = group
        user.save
        @my_user = user
      end
      return group
    end
    def create_post
      user = User.find_by(:id=>session[:user_id])
      post = Post.create(params)
      post.published = Time.new
      post.user = user
      post.save
      return post
    end
    # update helpers
    def valid_user?
      user = User.find_by(:email => params[:email])
      if user != nil && user.authenticate(params[:password])
        session[:user_id] = user.id
        return true
      else
        return false
      end
    end
    def update_group
      group = Group.find_by(:id =>params[:group_id])
      group.name = params[:name]
      group.bio = params[:bio]
      group.save
    end
    def join_group
      group = Group.find_by(:id=>params[:group_id])
      user = User.find_by(:id=>session[:user_id])
      user.group = group
      user.save
      @my_user = user
      return user
    end
    def leave_group 
      user = User.find_by(:id=>session[:user_id])
      user.group = nil
      user.save
      @my_user = user
    end
    def update_post
      user = User.find_by(:id=>session[:user_id])
      post = Post.find_by(:id => params[:post_id])
      post.content = params[:content]
      post.save
    end

    # relationship helpers
    def users_group?
      current_user.group == current_group
    end
    def users_post?
      user = User.find_by(:id=>session[:user_id])
      post = Post.find_by(:id=>params[:post_id])
      return post.user.id == user.id
    end
    def groups_post
      members_post = []
      current_group.users.each do |user| 
        user.posts.each do |post|
          members_post << post
        end
      end
      return members_post
    end
    def user_posts
      users_posts = []
      Post.all.each do |post|
        if post.user == current_user
          users_posts << post
        end
      end
    end
end
