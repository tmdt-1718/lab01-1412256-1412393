class CommentsController < ApplicationController
    def new
        
    end
            
    def create
        @comment = Comment.new(body: params[:post][:body], user_id: params[:post][:user_id], blog_id: params[:post][:blog_id] )
        if @comment.save
          flash[:success] = "Comment successfully."
          redirect_to blog_path(@comment.blog_id)
        end
    end

end
