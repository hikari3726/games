class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(topic_params)
    if @game.save
      redirect_to user_path(id: @game.user_id), success: '投稿しました'
    else
      render :new
    end
  end
  
  def index
    @games = Game.all
  end
  
  def show
    @game = Game.find_by(id: params[:id])
  end
  
  def edit
    @game = Game.find(params[:id])
  end
  
  private
  def topic_params
    params.require(:game).permit(:user_id, :image, :title, :description, :genre, :participation, :target_age, :play_time, :price)
  end
  
end
