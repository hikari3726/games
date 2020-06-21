class GamesController < ApplicationController
  before_action :require_login, {only: [:new, :create, :edit, :update]}
  
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(id: @game.id), success: '投稿しました'
    else
      render :new
    end
  end
  
  def index
    @games = Game.all.search(params[:search])
  end
  
  def show
    @game = Game.find_by(id: params[:id])
  end
  
  def edit
    @game = Game.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game.id), success: "変更しました"
    else
      render :edit
    end
  end
  
  def rank
    @games_rank = Game.find(Favorite.group(:game_id).order('count(game_id) desc').limit(5).pluck(:game_id))
  end
  
  def search
    if params[:title].present?
      @games = Game.where("title LIKE ?", "%{params[:title]%}")
    else
      @games = Game.none
    end
  end
    
  private
  def game_params
    params.require(:game).permit(:user_id, :image, :title, :description, :genre, :participation, :target_age, :play_time, :price)
  end

end