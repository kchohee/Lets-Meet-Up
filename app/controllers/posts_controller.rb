class PostsController < ApplicationController
get "/posts" do
    if logged_in?
        @posts = Post.all
        @user = User.find_by(:id=>session[:user_id])
        erb :"/posts/index"
    else 
        redirect "/login"
    end
end

get "/posts/new" do
    if logged_in?
        erb :"/posts/new"
    else
        redirect "/login"
    end
end

post "/posts/new" do
    if logged_in?
        @user = User.find_by(:id=>session[:user_id])
         @user.id
        # @post = Post.create(params)
        # @post.published = Time.new
        # @post.user = @user
        # @post.save
        # redirect "/posts/#{@post.id}"
    else
        erb :"posts/error"
     end
end

get "/posts/:id" do
    if logged_in?
        @user = User.find_by(:id=>session[:user_id])
        @post = Post.find_by(params)
        erb :"posts/show"
    else
        redirect "/login"
    end
end

# get "/posts/:id/edit" do
#     if logged_in?
#         @post = Post.find_by(params)
    
# end

patch "/posts/:id/edit" do
    
end

get "/posts/:id/delete" do
    if logged_in?
        erb :"/post/delete"
    else
        redirect "/login"
    end
end

delete "/posts/:id/delete" do
    
end

end