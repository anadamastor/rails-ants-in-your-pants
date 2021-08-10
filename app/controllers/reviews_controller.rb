class ReviewsController < ApplicationController
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :set_garden, except: [:destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.garden = @garden
    @review.user = current_user
    if @review.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to garden_path(@garden)
    else
      render :edit
    end
  end

  def destroy
    @review.garden = @garden
    @review.delete
    redirect_to garden_path(@garden)
  end

  private

  def find_review
    @review = Garden.find(params[:id])
  end

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :garden_id, :user_id)
  end
end
