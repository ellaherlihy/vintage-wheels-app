class ReviewsController < ApplicationController
  def create
    @reviews = Review.all
    @review = Review.new(review_params)
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    @review.car = @car
    if @review.save
      redirect_to car_path(@car)
    else
      render "cars/show", status: :unprocessable_entity
    end
  end

 private

  def review_params
    params.require(:review).permit(:content, :rating, :car_id)
  end
end
