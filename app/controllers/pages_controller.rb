class PagesController < ApplicationController
  PER = 6
  
  def index
    @topics = Topic.search(params[:search]).page(params[:page]).per(PER)
  end
end
