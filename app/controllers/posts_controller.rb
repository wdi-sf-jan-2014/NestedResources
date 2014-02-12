class PostsController < ApplicationController
    
    def index
        @post = Post.all
    end

    def create
        post = Post.create(params[:post].permit(:title, :link, :body))
        redirect_to post
    end

    def new
        @post = Post.new
    end

    def edit
        @post = Post.find(params[:id])
    end

    def show
        @post = Post.find(params[:id])
    end

    def update
    end

    def destroy
    end

end
