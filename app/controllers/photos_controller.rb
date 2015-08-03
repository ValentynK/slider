class PhotosController < ApplicationController
  respond_to :html, :xml

  def index
    @photos = Photo.all
    @photo_in_slider = []
      (0..@photos.count).each do |i|
        @photo_in_slider[i] = @photo[i]+@photo[i+1]+@photo[i+2]+@photo[i+3]
      end
    #binding.pry
  end

  def show
    @photo = Photo.find(params[:id])
    @photos = Photo.all
  end

  def create
    @photo = Photo.new(photo_params)
    #binding.pry
    @photo.save
    respond_with(@photo)
  end

  def new
    @photo = Photo.new
    @photos = Photo.all
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_with(@photo)
  end

  private
# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.
    def photo_params
      params.require(:photo).permit(:image)
    end
end
