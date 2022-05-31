class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to bookings_path(@bookings)
  end

private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id)
  end
end
