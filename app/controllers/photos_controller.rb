class PhotosController < ApplicationController
  respond_to :html, :xml

  def index
    @photo = Photo.all
    #binding.pry
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    #binding.pry
    @photo.save
    respond_with(@photo)
  end

  def new
    @photo = Photo.all
  end

  private
# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.
    def photo_params
      params.require(:photo).permit(:image)
    end
end
