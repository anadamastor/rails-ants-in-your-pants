class BookingsController < ApplicationController
    before_action :set_user
    before_action :set_garden
  
  def index
    # @garden = Garden.find(params[:garden_id])
    @bookings = @garden.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end
  
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.garden = @garden
    @booking.user = @user
    if @booking.save
      redirect_to profile_path
    else
      render :new
    end
  end


  def destroy
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :garden_id, :photo)
  end
end

