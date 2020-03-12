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
      user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
  def curr_user 
    user = User.find_by()
  end
  # post helpers
  def all_post
    posts = Post.all
  end
  def last_post
    post = Post.all.last
  end
  def current_post
    post = Post.find_by(:id=>params[:id])
  end
  def users_post
    post = Post.all.where(:user_id=> current_user)
  end
  # GROUPS HELPERS
    def all_groups
      group = Group.all
    end
    def last_group
      group = Group.all.last
    end
    def current_group
      group = Group.find_by(params[:id])
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
      user.save
      session[:user_id] = user.id
    end
    def create_group
      group = Group.create(params)
      user = User.find_by(:id=>session[:user_id])
      user.group = group
      user.save
    end
    def create_post
      user = User.find_by(:id=>session[:user_id])
      post = Post.create(params)
      post.published = Time.new
      post.user = user
      post.save
    end
    # update helpers
    def valid_user?
      @user = User.find_by(:email => params[:email])
      if @user != nil
        session[:user_id] = @user.id
        return true
      else
        return false
      end
    end
    def update_group
      group = Group.find_by(params[:id])
      group.name = params[:name]
      group.bio = params[:bio]
      group.save
    end
    def join_group
      group = Group.find_by(:id=>session[:id])
      user = User.find_by(:id=>session[:user_id])
      user.group = group
      user.save
    end
    def leave_group 
      current_user.group.destroy
      current_user.save
    end
    def update_post
      user = User.find_by(:id=>session[:user_id])
      post = Post.find_by(params[:post_id])
      post.content = params[:content]
      post.save
    end

    # relationship helpers
    def users_group?
      current_user.group = current_group
    end
    def users_post?
      user = User.find_by(:id=>session[:user_id])
      post = Post.find_by(params[:post_id])
      post.user == user
    end
    def groups_post
      members_post = []
      Post.all.each do |post|
        if post.user == current_group.users
          members_post << post
        end
      end
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
