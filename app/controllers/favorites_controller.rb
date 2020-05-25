class FavoritesController < ApplicationController
  
  def index
    @favorite_games = current_user.favorite_games
    @user = User.find_by(id: params[:user_id])
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.game_id = params[:game_id]
    
    if favorite.save
      redirect_to game_path(favorite.game_id), success: "お気に入りに登録しました"
    else
      redirect_to game_path(fovorite.game_id), danger: "お気に入り登録に失敗しました"
    end
  end
  
  def destroy
    favorite = Favorite.find_by(params[:game_id])
    if favorite.destroy
      redirect_to game_path(favorite.game_id), success: "お気に入り解除しました"
    else
      redirect_to game_path(favorite.game_id), danger: "お気に入り解除に失敗しました"
    end
  end
  
end
