class PostsController < ApplicationController
    before_action :authenticated?
    before_action :current_post, only: [:edit, :update, :destroy]

    def index
        @posts = Post.all
    end 

    def new 
        @post = Post.new
    end 

    def create 
        @user.posts.build(post_params).save
        redirect_to user_path(@user)
    end 

    def edit 
    end 

    def update 
    end 

    def destroy 
    end 


    def current_post
        @post = Post.find(post_params)
    end 

    private

    def post_params
        params.require(:post).permit(:image_url,:description,:genre_id)
    end 

end
