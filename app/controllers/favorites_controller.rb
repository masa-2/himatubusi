class FavoritesController < ApplicationController
  before_action :find_topic, only: [:create, :destroy]
  
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = current_user.favorites.new(topic_id: params[:topic_id])
    favorite.save
  end
  
  def destroy
    current_user.favorites.find_by(topic_id: params[:topic_id]).destroy
  end
  
  def find_topic
    @topic = Topic.find_by(id: params[:topic_id])
  end
end
