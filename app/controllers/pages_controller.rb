class PagesController < ApplicationController
  
  def index
    @games = Game.all
    @reviews = Review.all
    @games_rank = Game.find(Favorite.group(:game_id).order('count(game_id) desc').limit(5).pluck(:game_id))
  end
  
    
end
