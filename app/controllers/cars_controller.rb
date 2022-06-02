class CarsController < ApplicationController
  def index
    @cars = Car.all
    if params[:search]
      @cars = @cars.where("location ILIKE ?", "%#{params[:search][:query]}%")
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render "new", status: :unprocessable_entity
    end
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
    if @car.update(car_params)
      redirect_to users_index_path(@car)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

private
  def car_params
    params.require(:car).permit(:model, :year, :brand, :price, :features, :color, :location, :description, :users_id, :photo_url)
  end
end
