class BlogsController < ApplicationController

    before_action :get_blog, only: [:show,:edit, :update, :destroy]

    def index
        @blogs=Blog.all
    end

    def create
      @blog = Blog.new(title: params[:post][:title],  body: params[:post][:body], user_id: 1, view: 0 )
      if @blog.save
      flash[:success] = "Create successfully."
      render :show
    end

    def show
       #@blog.view=1
       #@blog.save
      # @blog = Blog.find(params[:id])
       @blog.update(view: @blog.view+1) 
       @blog.save
    end

    def update
      if @blog.update(blog_params)
        flash[:success] = "Update successfully."
        redirect_to blog_path(@blog.id)
      else
        flash[:error] = "Cannot update."
        render :show
      end
    end
  
    def destroy
      
  
      begin
        @blog.destroy!
        flash[:success] = "Delete successfully."
        redirect_to blogs_path
      rescue ActiveRecord::RecordNotDestroyed => e
        flash[:error] = "Cannot delete."
        render :show
      end
    end


    private
    def get_blog
      @blog = Blog.find(params[:id])
    end
  
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
