class AboutController < ApplicationController
  add_breadcrumb "Home", :homepage_path
  def index
    add_breadcrumb "About", about_path
  end
end
