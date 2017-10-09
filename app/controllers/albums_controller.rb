class AlbumsController < ApplicationController
    before_action :get_album, only: [:show, :showphoto]
    add_breadcrumb "Home", :homepage_path
  
  
    def index
      @albums=Album.limit(10)
      add_breadcrumb "Albums", albums_path
    end
    
    def show
      add_breadcrumb "Albums", albums_path
      add_breadcrumb @album.title, album_path(@album.id)
    end

    def showphoto
      add_breadcrumb "Albums", albums_path
      add_breadcrumb @album.title, album_path(@album.id)
      @photo = Photo.find(params[:photo_id])
      add_breadcrumb @photo.name, photo_path(@album.id,@photo.id)
      @album.update(views: @album.views+1) 
      @photo.update(view: @photo.view+1) 
    end

    private
    def get_album
      @album = Album.find(params[:id])
    end
    
  
end
