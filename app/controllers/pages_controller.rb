class PagesController < ApplicationController
  PER = 1
  
  def index
    topic = params[:description].present? ? Topic.where("description LIKE ?", "%#{params[:description]}%") : Topic.all
    @topics = topic.page(params[:page]).per(PER)
  end
end
