class BookingsController < ApplicationController

  def index
    @garden = Garden.find(params[:garden_id])
    @bookings = @garden.bookings
  end

  def show
  end

  def create
  end

  def new
  end

  def destroy
  end

  private

end

