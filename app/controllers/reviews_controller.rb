class ReviewsController < ApplicationController
  def new
    # need to find restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    # make a Review.new
    @review = Review.new
  end

  def create
    #find the restaurant so we can get the id for the review
    @restaurant = Restaurant.find(params[:restaurant_id])
    #create a new review with params
    @review = Review.new(review_params)
    #set the restaurant
    @review.restaurant = @restaurant
    #save
    if @review.save
    #redirect to restaurants show
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)

  end


  def review_params
    params.require(:review).permit(:content)

  end



end
