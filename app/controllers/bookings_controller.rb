class BookingsController < ApplicationController
  before_action :set_garden

  def index
    # @garden = Garden.find(params[:garden_id])
    @bookings = @garden.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
  end

  def new
  end

  def destroy
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end
end

