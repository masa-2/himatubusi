class FavoritesController < ApplicationController
  before_action :find_topic, only: [:create, :destroy]
  
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    
    favorite.save

  end
  
  def destroy
    Favorite.find_by(params[:topic_id]).destroy
  end
  
  def find_topic
    @topic = Topic.find_by(id: params[:topic_id])
  end
end
