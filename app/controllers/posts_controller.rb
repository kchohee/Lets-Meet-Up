class PostsController < ApplicationController
get "/posts" do
    if logged_in?
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
    if valid_post?
        if logged_in?
            post = create_post
            redirect "/posts/#{post.id}"
        else
            erb :"posts/error"
        end
    else
        redirect "/login"
    end
end

get "/posts/:post_id" do
    if logged_in?
        erb :"/posts/show"
     else
       redirect "/login"
     end
end

get "/posts/:post_id/edit" do
    if logged_in?
        erb :"/posts/edit"
    else
        redirect "/login"
    end
end

patch "/posts/:post_id/edit" do
    if current_post.user != current_user
        erb :'/posts/error'
    else
        post = update_post
        redirect "/posts/#{current_post.id}"
    end
end

get "/posts/:post_id/delete" do
    if logged_in?
        erb :"/posts/delete"
    else
        redirect "/login"
    end
end

delete "/posts/:post_id/delete" do
    if logged_in?
        if users_post?
            Post.destroy(params[:post_id])
            redirect "/posts"
        else
            erb :"/posts/error"
        end
    else
        redirect "/login"
    end
end

end