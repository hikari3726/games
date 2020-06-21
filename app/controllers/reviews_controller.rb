class ReviewsController < ApplicationController
  before_action :require_login, {only: [:new, :edit]}
  
  def new
    @game = Game.find_by(id: params[:game_id])
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @game = Game.find_by(params[:id])
    if @review.save
      redirect_to game_path(id: @review.game_id), success: "レビューを投稿しました"
    else
      render :new
    end
  end

  def edit
    @review = Review.find_by(params[:id])
    @game = Game.find_by(id: @review.game_id)
  end
  
  def update
    @review = Review.new(review_params)
    @game = Game.find_by(params[:id])
    if @review.save
      redirect_to game_path(id: @review.game_id), success: "レビューを変更しました"
    else
      render :edit
    end
  end

  def show
    @review = Review.find_by(id: params[:id])
  end
  
  def index
    @reviews = Review.all
  end
  
  private
    def review_params
      params.require(:review).permit(:comment, :evalution, :user_id, :game_id)
    end
    
end
