class AboutController < ApplicationController
  add_breadcrumb "Home", :home_index_path
  def index
    add_breadcrumb "About", about_path
  end
end
