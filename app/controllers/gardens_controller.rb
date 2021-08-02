class GardensController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :set_user
    before_action :set_garden, only: [:show, :edit, :update, :destroy]

    def index
      @gardens = Garden.all
      @markers = @gardens.geocoded.map do |garden|
        {
          lat: garden.latitude,
          lng: garden.longitude
        }
      end
    end

    def show
    end

    def edit
    end

    def new
      @garden = Garden.new
    end

    def create
      @garden = Garden.new(params)
      @garden.user = @user
      if @garden.save
        redirect_to garden_path(@garden)
      else
        render :edit
      end
    end

    def destroy
      @garden.delete
      redirect_to gardens_path
    end

    private

    def params
      params.require(:garden).permit(:title, :address, :price)
    end

    def set_user
      if user_signed_in?
        @user = current_user
      end
    end

    def set_garden
      @garden = Garden.find(params[:id])
    end
end
