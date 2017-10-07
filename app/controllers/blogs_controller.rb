class BlogsController < ApplicationController

    before_action :get_blog, only: [:show,:edit, :update, :destroy]

    def index
        @blogs=Blog.all
    end

    def create
      @blog = Blog.new(title: params[:post][:title],  body: params[:post][:body], user_id: 1, view: 0 )
      @blog.save
      render :show
    end

    def show
       #@blog.view=1
       #@blog.save
      # @blog = Blog.find(params[:id])
       @blog.update(view: @blog.view+1) 
       @blog.save
    end

    
end
