class BlogsController < ApplicationController

    #before_action :get_blog, only: [:show, :edit, :update, :destroy]

    def index
        @blogs=Blog.all
    end

    def show
       #@blog.view=1
       #@blog.save
       @blog = Blog.find(params[:id])
       @blog.update(view: @blog.view+1) 

    end

    private
    def get_blog
      @blog = Blog.find(params[:id])
    end
  
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
