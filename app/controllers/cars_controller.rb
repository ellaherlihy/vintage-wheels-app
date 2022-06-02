class CarsController < ApplicationController
  def index
    if params[:search].present?
      @cars = Car.where("location ILIKE ?", "%#{params[:search][:query]}%")
    else
      @cars = Car.all
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    @car.save
    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, status: :see_other
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
  end

  def update
    @car = Car.find(params[:id])
    @booking = Booking.new
  end

private
  def car_params
    params.require(:car).permit(:model, :year, :brand, :price, :features, :color, :location, :description, :users_id, :photo_url)
  end
end
