class CommentsController < ApplicationController

    def index
        @parent = parent
       @comments = @parent.comments
    end

    def new
        if user_signed_in?
            @comment = parent.comments.new
        else
            redirect_to new_user_session_path
        end
    end

    def create
        if user_signed_in?
            comment = parent.comments.create(comment_params)
            current_user.comments << comment
            if parent.class.to_s == "Comment"
                redirect_to comment_comments_path parent
            else
                redirect_to parent
            end
        else
            redirect_to new_user_session_path
        end
    end

    def show
        @comment = parent.comments.find(comment_id)
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end

    def parent
        if post_id
            Post.find(post_id)
        elsif parent_comment_id
            Comment.find(parent_comment_id)
        end
    end

    def parent_comment_id
        params[:comment_id]
    end
    def post_id
        params[:post_id]
    end

    def comment_id
        params[:id]
    end

end
