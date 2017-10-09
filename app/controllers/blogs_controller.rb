class BlogsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :get_blog, only: [:show,:edit, :update, :destroy]
  add_breadcrumb "Home", :homepage_path


  def index
    @blogs=Blog.limit(10)
    add_breadcrumb "Blogs", blogs_path
  end

  def new
    add_breadcrumb "Blogs", blogs_path
    add_breadcrumb "New", new_blog_path
  end

  def create
    @blog = Blog.new(title: params[:post][:title],  body: params[:post][:body], user_id: params[:post][:user_id], avatar:'https://i.imgur.com/DnBLcJo.jpg', view: 0 )
    if @blog.save
      flash[:success] = "Create successfully."
      render :show
    end
  end

  def show
    add_breadcrumb "Blogs", blogs_path
    add_breadcrumb @blog.title, blog_path(@blog.id)
    #@blog.view=1
    #@blog.save
    # @blog = Blog.find(params[:id])
    @blog.update(view: @blog.view+1) 
    @blog.save
  end

  def edit
    add_breadcrumb "Blogs", blogs_path
    add_breadcrumb "Edit", edit_blog_path(@blog.id)
  end

  def update
    if (session[:current_user_id]==@blog.user_id)
      if @blog.update(blog_params)
        flash[:success] = "Update successfully."
        redirect_to blog_path(@blog.id)
      else
        flash[:error] = "Cannot update."
        render :show
      end
    else
      flash[:error] = "You can not update."
      render :show
    end
  end
  

  def destroy
    if (session[:current_user_id]==@blog.user_id)
      begin
        @blog.destroy!
        flash[:success] = "Delete successfully."
        redirect_to blogs_path
      rescue ActiveRecord::RecordNotDestroyed => e
        flash[:error] = "Cannot delete."
        render :show
      end
    else
      flash[:error] = "You can not delete."
      redirect_to blog_path
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

