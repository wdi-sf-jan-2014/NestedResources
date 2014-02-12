class CommentsController < ApplicationController

    def index
        @post = Post.find(params[:post_id])
    end

    def create
        new_comment = params.require(:comment).permit(:body)
        post = Post.find(params[:post_id])
        comment = Post.comments.create(new_comment)
        # redirect_to 
    end

    def new
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build
    end

    def edit
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end

    def show
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end
    
    def update
        updated_comments = params.require(:comment).permit(:body)
        post = Post.find(params[:post_id])
        comment = post.comments.find(params[:id])
        comment.update_attributes(updated_comments)
        # redirect_to
    end

    def destroy
    end
    
end
