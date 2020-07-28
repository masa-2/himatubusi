class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    
    if favorite.save
      # redirect_to root_path, success: 'お気に入りにしました！'
    else
      # redirect_to root_path, danger: 'お気に入りに失敗しました。。'
    end
  end
  
  def destroy
    Favorite.find_by(params[:topic_id]).destroy
    flash[:success] = "お気に入り解除！！！！！"
    # redirect_to root_path
  end
  
end
