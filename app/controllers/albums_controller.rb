class AlbumsController < ApplicationController
    before_action :get_blog, only: [:show]
    add_breadcrumb "Home", :homepage_path
  
  
    def index
      @albums=Album.limit(10)
      add_breadcrumb "Albums", albums_path
    end
    
    def show
      add_breadcrumb "Albums", albums_path
      add_breadcrumb @album.title, album_path(@album.id)
      #@album.view=1
      #@album.save
      # @album = album.find(params[:id])
      #@album.update(views: @album.view+1) 
      #@album.save
    end
  
end
