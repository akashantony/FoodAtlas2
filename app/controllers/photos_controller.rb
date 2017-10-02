class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @photo = Photo.new(photo_allowed_params)
    @photo.user_id = @restaurant.creator_id
    @photo.restaurant = @restaurant
    if @photo.save
      @restaurant.photos
      redirect_to root_url
    else
      redirect_to @restaurant
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
      @photo = Photo.find(params[:id])
        if @photo
        @photo.destroy
        redirect_to root_url, notice: 'delete done!'
      else
        status 400
      end
  end

  def photo_allowed_params
    params.require(:photo).permit(:image)
  end
end
