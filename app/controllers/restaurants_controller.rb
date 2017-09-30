class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_allowed_params)
    @restaurant.creator_id = current_user.id
    if @restaurant.save
      redirect_to user_profile_path(current_user), notice: "Thank You"
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_allowed_params)
      redirect_to user_profile_path(current_user), notice: "Thank You"
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    if @restaurant
      @restaurant.destroy
      redirect_to user_profile_path, notice: 'delete done!'
    else
      status 400
    end
  end

  def restaurant_allowed_params
    params.require(:restaurant).permit(:name, :cuisine, :longitude, :latitude)
  end

  def current_user
    @current_user = User.find(session[:user_id])
  end
end
